//
//  SubstrateAdditions.h
//
//  Created by Andrew Richardson on 12-08-06.
//

#import <Foundation/Foundation.h>

// Hook a method using a block. The block should match the
// method signature of the original method, only the first
// argument is reserved for self. The second argument should
// NOT be reserved for _cmd.
void MSHookMessageWithBlock(Class cls, SEL sel, void *block, IMP *orig);

// Use an associated object to retain control of the origianl
// IMP. The IMP can be retrieved using MSGetImpForAssociatedObject.
// Typically used for temporary hooks.
// WARNING: This function currently does not distinguish between two identically-named
// methods of different classes, nor does it provide guards against a deallocated associated object. Plan accordingly!
void MSHookMessageWithBlockAssociated(Class cls, SEL sel, void *block, id associatedObj);

// Retrieves the IMP retained by the associated object for the given selector.
// Will return a fallback IMP that prints an error if the associated IMP
// could not be found.
IMP MSGetImpForAssociatedObject(id associatedObj, SEL sel);

static inline BOOL objectRespondsToSelector(id obj, SEL sel)
{
    if (!obj || !sel)
        return NO;
    else if (![obj respondsToSelector:sel]) {
        NSLog(@"Object %@ does NOT respond to selector %@", obj, NSStringFromSelector(sel));
        return NO;
    }
    
    return YES;
}

#define responds(obj, sel) (objectRespondsToSelector(obj, @selector(sel)))
#define performIfResponds(obj, sel) (responds(obj, sel) ? [obj performSelector:@selector(sel)] : nil)
#define performIfRespondsWithObject(obj, sel, arg) (responds(obj, sel) ? [obj performSelector:@selector(sel) withObject:arg] : nil)
#define performIfRespondsWithObjectWithObject(obj, sel, arg1, arg2) (responds(obj, sel) ? [obj performSelector:@selector(sel) withObject:arg1 withObject:arg2] : nil)

#define retrieveStaticClass(cls) if (!cls) cls = NSClassFromString([[NSString stringWithUTF8String:#cls] substringFromIndex:1])

#define MSHookIvarSafe(obj, name) (MSHookIvar<id>(obj, #name) != NULL ? MSHookIvar<id>(obj, #name) : nil)
#define MSIvarExists(class, name) (class_getInstanceVariable(class, #name) != NULL)
#define MSSafeSetIvar(obj, name, newIvar) if (MSIvarExists([obj class], name)) MSHookIvar<id>(obj, #name) = newIvar