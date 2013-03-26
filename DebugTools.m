//
//  DebugTools.m
//  Jukebox
//
//  Created by Andrew Richardson on 12-05-04.
//  Copyright (c) 2012. All rights reserved.
//

#import "DebugTools.h"

#import <substrate.h>
#import <objc/runtime.h>

static BOOL backtraceEnabled = YES;

void setEnableBacktrace(BOOL enable) {
    backtraceEnabled = enable;
}

#ifdef DEBUG
void executeDebugBlock(DTVoidBlock block) {
    if (block)
        block();
}

NSUncaughtExceptionHandler *prevExceptionHandler = NULL;

static void HandleException(NSException *exception)
{
	NSArray *callStack = [NSThread callStackSymbols];
	NSLog(@"Terminating due to exception %@; backtrace: %@", exception, callStack);
    
    UninstallUncaughtExceptionHandler();
    
    // don't call self!
    if (prevExceptionHandler && prevExceptionHandler != HandleException)
        prevExceptionHandler(exception);
    else
        [exception raise];
}

static CFMutableDictionaryRef oldSigHandlers;

static void SignalHandler(int signal)
{
	NSArray *callStack = [NSThread callStackSymbols];
	NSLog(@"Terminating due to signal %s; backtrace: %@", strsignal(signal), callStack);
    
    UninstallUncaughtExceptionHandler();
    
    void (*oldHandler)(int) = CFDictionaryGetValue(oldSigHandlers, signal);
    if (oldHandler)
        oldHandler(signal);
    else
        kill(getpid(), signal);
}

static const int sigs[] = {SIGABRT, SIGILL, SIGSEGV, SIGFPE, SIGBUS, SIGPIPE, SIGQUIT, SIGTRAP, SIGEMT, SIGSYS};

void UninstallUncaughtExceptionHandler(void) {
    NSSetUncaughtExceptionHandler(prevExceptionHandler);
	for (int i = 0; i < sizeof(sigs); i++)
		signal(sigs[i], SIG_DFL);
}

void InstallUncaughtExceptionHandler(void)
{
    static BOOL isInstalled = NO;
    if (isInstalled)
        return;
    
    isInstalled = YES;
    
    prevExceptionHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(&HandleException);
	
	oldSigHandlers = CFDictionaryCreateMutable(kCFAllocatorDefault, sizeof(sigs), NULL, NULL);
    
    for (int i = 0; i < sizeof(sigs); i++) {
        struct sigaction action;
        void *oldHandler = NULL;
        
        sigaction(sigs[i], NULL, &action);
        oldHandler = action.__sigaction_u.__sa_handler;
        if (oldHandler)
			CFDictionarySetValue(oldSigHandlers, sigs[i], oldHandler);
        
        signal(sigs[i], SignalHandler);
    }
}
#endif

// The following is adapted from
// http://smallduck.wordpress.com/2011/06/20/cocoa-terse-backtrace-using-nsregularexpression/
@implementation NSThread (StackTraceAdditions)

+ (NSString *)appBacktraceOfDepth:(int)depth fromStackSymbols:(NSArray *)frames { 
    return [self backtraceOfDepth:depth fromStackSymbols:frames matching:[[NSBundle bundleForClass:[self class]] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey]]; 
}

+ (NSString *)backtraceOfDepth:(int)depth fromStackSymbols:(NSArray *)frames { 
    return [self backtraceOfDepth:depth fromStackSymbols:frames matching:nil]; 
}

+ (NSString *)backtraceOfDepth:(int)depth fromStackSymbols:(NSArray *)frames matching:(NSString *)from {
    return [self backtraceInRange:NSMakeRange(1, depth) fromStackSymbols:frames matching:from];
}

+ (NSString *)backtraceOfDepth:(int)depth {
    return [self backtraceInRange:NSMakeRange(2, depth)];
}

+ (NSString *)backtraceInRange:(NSRange)range {
    NSArray *callStack = [NSThread callStackSymbols];
    NSArray *parsedStack = [callStack subarrayWithRange:NSMakeRange(1, callStack.count-1)];
    
    return [self backtraceInRange:range fromStackSymbols:parsedStack matching:nil];
}

+ (NSString *)appBacktraceInRange:(NSRange)range {
    NSArray *callStack = [NSThread callStackSymbols];
    NSArray *parsedStack = [callStack subarrayWithRange:NSMakeRange(1, callStack.count-1)];
    
    return [self appBacktraceInRange:range fromStackSymbols:parsedStack];
}

+ (NSString *)appBacktraceInRange:(NSRange)range fromStackSymbols:(NSArray *)frames { 
    return [self backtraceInRange:range fromStackSymbols:frames matching:[[NSBundle bundleForClass:[self class]] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey]];
}

+ (NSString *) backtraceInRange:(NSRange)range fromStackSymbols:(NSArray *)frames matching:(NSString *)from {
    NSRegularExpression *regex = nil;
    NSString *result = nil;
    
    if (!backtraceEnabled)
        return nil;
    
    if (!NSClassFromString(@"NSRegularExpression") || 
        !(regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+ +(.+[^ ]) +0x[0-9a-f]+ (.+) \\+ [0-9a-f]+" options:0 error:nil]))
        return [[frames objectAtIndex:range.location] substringFromIndex:51]; // no regex, be lame and rely on column counts
    
    for (int goodframes = 0, framenum = range.location; goodframes < range.length && framenum < [frames count]; ++framenum) {
        NSString *frame = [frames objectAtIndex:framenum];
        NSTextCheckingResult *match = [regex firstMatchInString:frame options:0 range:NSMakeRange(0, [frame length])];
        if (!match)
            NSAssert1(NO, @"unparsed stack frame: %@", frame);
        if (from && ![from isEqualToString:[regex replacementStringForResult:match inString:frame offset:0 template:@"$1"]])
            continue;
        ++goodframes;
        NSString *caller = [regex replacementStringForResult:match inString:frame offset:0 template:@"$2"];
        if (from && goodframes == 1 && [caller isEqualToString:@"main"])
            return [self backtraceInRange:range fromStackSymbols:frames matching:nil]; // no useful calls from us, take ones from anyone instead
        result = !result ? caller : [result stringByAppendingFormat:@" < %@", caller];
    }
    
    return result ? result : @"?";
}

@end