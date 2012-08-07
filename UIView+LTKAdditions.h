//  
//  UIView+LTKAdditions.h
//  LTKit
//  
//  Copyright (c) 2011 Michael Potter
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without restriction, including //	without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject //	to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface UIView (LTKAdditions)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;
@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;
@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) CGFloat frameMinX;
@property (nonatomic) CGFloat frameMidX;
@property (nonatomic) CGFloat frameMaxX;
@property (nonatomic) CGFloat frameMinY;
@property (nonatomic) CGFloat frameMidY;
@property (nonatomic) CGFloat frameMaxY;
@property (nonatomic) CGPoint frameTopLeftPoint;
@property (nonatomic) CGPoint frameTopMiddlePoint;
@property (nonatomic) CGPoint frameTopRightPoint;
@property (nonatomic) CGPoint frameMiddleRightPoint;
@property (nonatomic) CGPoint frameBottomRightPoint;
@property (nonatomic) CGPoint frameBottomMiddlePoint;
@property (nonatomic) CGPoint frameBottomLeftPoint;
@property (nonatomic) CGPoint frameMiddleLeftPoint;
@property (nonatomic) CGPoint boundsOrigin;
@property (nonatomic) CGSize boundsSize;
@property (nonatomic) CGFloat boundsX;
@property (nonatomic) CGFloat boundsY;
@property (nonatomic) CGFloat boundsWidth;
@property (nonatomic) CGFloat boundsHeight;
@property (nonatomic) CGFloat boundsMinX;
@property (nonatomic) CGFloat boundsMidX;
@property (nonatomic) CGFloat boundsMaxX;
@property (nonatomic) CGFloat boundsMinY;
@property (nonatomic) CGFloat boundsMidY;
@property (nonatomic) CGFloat boundsMaxY;
@property (nonatomic) CGPoint boundsTopLeftPoint;
@property (nonatomic) CGPoint boundsTopMiddlePoint;
@property (nonatomic) CGPoint boundsTopRightPoint;
@property (nonatomic) CGPoint boundsMiddleRightPoint;
@property (nonatomic) CGPoint boundsBottomRightPoint;
@property (nonatomic) CGPoint boundsBottomMiddlePoint;
@property (nonatomic) CGPoint boundsBottomLeftPoint;
@property (nonatomic) CGPoint boundsMiddleLeftPoint;

@end