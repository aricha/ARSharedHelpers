//
//  DebugTools.h
//
//  Created by Andrew Richardson on 12-05-04.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#define DTExtern extern "C"
#else
#define DTExtern extern
#endif

typedef void (^DTVoidBlock)(void);

#ifdef DEBUG
// Executes block in debug mode, but does nothing in release mode - works best
// with block literals declared within the function call, since the macro means
// it won't be compiled at all in release
DTExtern void executeDebugBlock(DTVoidBlock block);

DTExtern void disableNSLog(void);

// Logs the stack trace when a signal / exception is received, but otherwise
// does nothing to handle it
DTExtern void InstallUncaughtExceptionHandler(void);
DTExtern void UninstallUncaughtExceptionHandler(void);
#else
#define executeDebugBlock(block)
#define disableNSLog()
#define InstallUncaughtExceptionHandler()
#define UninstallUncaughtExceptionHandler()
#endif

// Defaults to enabled - used in DLog and some other macros here.
DTExtern void setEnableBacktrace(BOOL enable);

@interface NSThread (StackTraceAdditions)
+ (NSString *)appBacktraceOfDepth:(int)depth fromStackSymbols:(NSArray *)frames;
+ (NSString *)backtraceOfDepth:(int)depth;
+ (NSString *)backtraceOfDepth:(int)depth fromStackSymbols:(NSArray *)frames;
+ (NSString *)backtraceOfDepth:(int)depth fromStackSymbols:(NSArray *)frames matching:(NSString *)from;

+ (NSString *)backtraceInRange:(NSRange)range;
+ (NSString *)appBacktraceInRange:(NSRange)range;
+ (NSString *)appBacktraceInRange:(NSRange)range fromStackSymbols:(NSArray *)frames;
+ (NSString *)backtraceInRange:(NSRange)range fromStackSymbols:(NSArray *)frames matching:(NSString *)from;
@end

#ifdef DEBUG
#define DLog(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define ULog(fmt, ...) { UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease]; [alert show]; }

#define LOG_FN_CALL DLog(@"was called")
#define LOG_FN_CALLER DLog(@"was called by %@", [NSThread backtraceOfDepth:1 fromStackSymbols:[NSThread callStackSymbols]]);
#define LOG_FN_CALL_FINISHED DLog(@"has finished")
#define LOG_LINE DLog(@"")
#define LOG_THREAD DLog(@"Main thread: %@", ([NSThread isMainThread] ? @"YES" : @"NO"))
#define LOG_BACKTRACE DLog(@"Backtrace: %@", [NSThread callStackSymbols])
#else
#define DLog(fmt, ...)
#define ULog(fmt, ...)

#define LOG_FN_CALL
#define LOG_FN_CALL_FINISHED
#define LOG_LINE
#define LOG_THREAD
#define LOG_BACKTRACE
#endif