//
//  SubstrateAdditions.m
//
//  Created by Andrew Richardson on 12-08-06.
//
//

#import "SubstrateAdditions.h"
#import <objc/runtime.h>

extern void MSHookMessageEx(Class _class, SEL sel, IMP imp, IMP *result);

void MSHookMessageWithBlock(Class cls, SEL sel, void *block, IMP *orig)
{
    IMP blockImp = imp_implementationWithBlock(block);
    MSHookMessageEx(cls, sel, blockImp, orig);
}

void MSHookMessageWithBlockAssociated(Class cls, SEL sel, void *block, id associatedObj)
{
    IMP origImp = NULL;
    MSHookMessageWithBlock(cls, sel, block, &origImp);
    if (associatedObj) {
        objc_setAssociatedObject(associatedObj, 
                                 sel,
                                 [NSValue valueWithPointer:origImp], 
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

static IMP MSFallbackIMP(id self, SEL _cmd, ...)
{
    NSLog(@"Error: Calling fallback IMP for [%@ %@]", self, NSStringFromSelector(_cmd));
    
    return nil;
}

IMP MSGetImpForAssociatedObject(id associatedObj, SEL sel)
{
    IMP associatedIMP = NULL;
    NSValue *ptrVal = objc_getAssociatedObject(associatedObj, sel);
    
    if (ptrVal && [ptrVal pointerValue] != NULL)
        associatedIMP = (IMP)[ptrVal pointerValue];
    else {
        NSLog(@"Error: No matching IMP found for associated object %@ with selector %@", associatedObj, (sel ? NSStringFromSelector(sel) : @"(null)"));
        associatedIMP = (IMP)MSFallbackIMP;
    }
    
    return associatedIMP;
}