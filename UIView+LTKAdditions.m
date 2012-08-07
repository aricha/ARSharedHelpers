//  
//  UIView+LTKAdditions.m
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

#import "UIView+LTKAdditions.h"

@implementation UIView (LTKAdditions)

#pragma mark - Property Accessors

- (CGPoint)frameOrigin
{
	return self.frame.origin;
}

- (void)setFrameOrigin:(CGPoint)frameOrigin
{
	CGRect frame = self.frame;
	frame.origin = frameOrigin;

	self.frame = frame;
}

- (CGSize)frameSize
{
	return self.frame.size;
}

- (void)setFrameSize:(CGSize)frameSize
{
	CGRect frame = self.frame;
	frame.size = frameSize;

	self.frame = frame;
}

- (CGFloat)frameX
{
	return self.frame.origin.x;
}

- (void)setFrameX:(CGFloat)frameX
{
	CGRect frame = self.frame;
	frame.origin.x = frameX;

	self.frame = frame;
}

- (CGFloat)frameY
{
	return self.frame.origin.y;
}

- (void)setFrameY:(CGFloat)frameY
{
	CGRect frame = self.frame;
	frame.origin.y = frameY;

	self.frame = frame;
}

- (CGFloat)frameWidth
{
	return self.frame.size.width;
}

- (void)setFrameWidth:(CGFloat)frameWidth
{
	CGRect frame = self.frame;
	frame.size.width = frameWidth;

	self.frame = frame;
}

- (CGFloat)frameHeight
{
	return self.frame.size.height;
}

- (void)setFrameHeight:(CGFloat)frameHeight
{
	CGRect frame = self.frame;
	frame.size.height = frameHeight;

	self.frame = frame;
}

- (CGFloat)frameMinX
{
	return CGRectGetMinX(self.frame);
}

- (void)setFrameMinX:(CGFloat)frameMinX
{
	self.frameX = frameMinX;
}

- (CGFloat)frameMidX
{
	return CGRectGetMidX(self.frame);
}

- (void)setFrameMidX:(CGFloat)frameMidX
{
	self.frameX = (frameMidX - (self.frameWidth / 2.0f));
}

- (CGFloat)frameMaxX
{
	return CGRectGetMaxX(self.frame);
}

- (void)setFrameMaxX:(CGFloat)frameMaxX
{
	self.frameX = (frameMaxX - self.frameWidth);
}

- (CGFloat)frameMinY
{
	return CGRectGetMinY(self.frame);
}

- (void)setFrameMinY:(CGFloat)frameMinY
{
	self.frameY = frameMinY;
}

- (CGFloat)frameMidY
{
	return CGRectGetMidY(self.frame);
}

- (void)setFrameMidY:(CGFloat)frameMidY
{
	self.frameY = (frameMidY - (self.frameHeight / 2.0f));
}

- (CGFloat)frameMaxY
{
	return CGRectGetMaxY(self.frame);
}

- (void)setFrameMaxY:(CGFloat)frameMaxY
{
	self.frameY = (frameMaxY - self.frameHeight);
}

- (CGPoint)frameTopLeftPoint
{
	return CGPointMake(self.frameMinX, self.frameMinY);
}

- (void)setFrameTopLeftPoint:(CGPoint)frameTopLeftPoint
{
	self.frameMinX = frameTopLeftPoint.x;
	self.frameMinY = frameTopLeftPoint.y;
}

- (CGPoint)frameTopMiddlePoint
{
	return CGPointMake(self.frameMidX, self.frameMinY);
}

- (void)setFrameTopMiddlePoint:(CGPoint)frameTopMiddlePoint
{
	self.frameMidX = frameTopMiddlePoint.x;
	self.frameMinY = frameTopMiddlePoint.y;
}

- (CGPoint)frameTopRightPoint
{
	return CGPointMake(self.frameMaxX, self.frameMinY);
}

- (void)setFrameTopRightPoint:(CGPoint)frameTopRightPoint
{
	self.frameMaxX = frameTopRightPoint.x;
	self.frameMinY = frameTopRightPoint.y;
}

- (CGPoint)frameMiddleRightPoint
{
	return CGPointMake(self.frameMaxX, self.frameMidY);
}

- (void)setFrameMiddleRightPoint:(CGPoint)frameMiddleRightPoint
{
	self.frameMaxX = frameMiddleRightPoint.x;
	self.frameMidY = frameMiddleRightPoint.y;
}

- (CGPoint)frameBottomRightPoint
{
	return CGPointMake(self.frameMaxX, self.frameMaxY);
}

- (void)setFrameBottomRightPoint:(CGPoint)frameBottomRightPoint
{
	self.frameMaxX = frameBottomRightPoint.x;
	self.frameMaxY = frameBottomRightPoint.y;
}

- (CGPoint)frameBottomMiddlePoint
{
	return CGPointMake(self.frameMidX, self.frameMaxY);
}

- (void)setFrameBottomMiddlePoint:(CGPoint)frameBottomMiddlePoint
{
	self.frameMidX = frameBottomMiddlePoint.x;
	self.frameMaxY = frameBottomMiddlePoint.y;
}

- (CGPoint)frameBottomLeftPoint
{
	return CGPointMake(self.frameMinX, self.frameMaxY);
}

- (void)setFrameBottomLeftPoint:(CGPoint)frameBottomLeftPoint
{
	self.frameMinX = frameBottomLeftPoint.x;
	self.frameMaxY = frameBottomLeftPoint.y;
}

- (CGPoint)frameMiddleLeftPoint
{
	return CGPointMake(self.frameMinX, self.frameMidY);
}

- (void)setFrameMiddleLeftPoint:(CGPoint)frameMiddleLeftPoint
{
	self.frameMinX = frameMiddleLeftPoint.x;
	self.frameMidY = frameMiddleLeftPoint.y;
}

- (CGPoint)boundsOrigin
{
	return self.bounds.origin;
}

- (void)setBoundsOrigin:(CGPoint)boundsOrigin
{
	CGRect bounds = self.bounds;
	bounds.origin = boundsOrigin;

	self.bounds = bounds;
}

- (CGSize)boundsSize
{
	return self.bounds.size;
}

- (void)setBoundsSize:(CGSize)boundsSize
{
	CGRect bounds = self.bounds;
	bounds.size = boundsSize;

	self.bounds = bounds;
}

- (CGFloat)boundsX
{
	return self.bounds.origin.x;
}

- (void)setBoundsX:(CGFloat)boundsX
{
	CGRect bounds = self.bounds;
	bounds.origin.x = boundsX;

	self.bounds = bounds;
}

- (CGFloat)boundsY
{
	return self.bounds.origin.y;
}

- (void)setBoundsY:(CGFloat)boundsY
{
	CGRect bounds = self.bounds;
	bounds.origin.y = boundsY;

	self.bounds = bounds;
}

- (CGFloat)boundsWidth
{
	return self.bounds.size.width;
}

- (void)setBoundsWidth:(CGFloat)boundsWidth
{
	CGRect bounds = self.bounds;
	bounds.size.width = boundsWidth;

	self.bounds = bounds;
}

- (CGFloat)boundsHeight
{
	return self.bounds.size.height;
}

- (void)setBoundsHeight:(CGFloat)boundsHeight
{
	CGRect bounds = self.bounds;
	bounds.size.height = boundsHeight;

	self.bounds = bounds;
}

- (CGFloat)boundsMinX
{
	return CGRectGetMinX(self.bounds);
}

- (void)setBoundsMinX:(CGFloat)boundsMinX
{
	self.boundsX = boundsMinX;
}

- (CGFloat)boundsMidX
{
	return CGRectGetMidX(self.bounds);
}

- (void)setBoundsMidX:(CGFloat)boundsMidX
{
	self.boundsX = (boundsMidX - (self.boundsWidth / 2.0f));
}

- (CGFloat)boundsMaxX
{
	return CGRectGetMaxX(self.bounds);
}

- (void)setBoundsMaxX:(CGFloat)boundsMaxX
{
	self.boundsX = (boundsMaxX - self.boundsWidth);
}

- (CGFloat)boundsMinY
{
	return CGRectGetMinY(self.bounds);
}

- (void)setBoundsMinY:(CGFloat)boundsMinY
{
	self.boundsY = boundsMinY;
}

- (CGFloat)boundsMidY
{
	return CGRectGetMidY(self.bounds);
}

- (void)setBoundsMidY:(CGFloat)boundsMidY
{
	self.boundsY = (boundsMidY + (self.boundsHeight / 2.0f));
}

- (CGFloat)boundsMaxY
{
	return CGRectGetMaxY(self.bounds);
}

- (void)setBoundsMaxY:(CGFloat)boundsMaxY
{
	self.boundsY = (boundsMaxY - self.boundsHeight);
}

- (CGPoint)boundsTopLeftPoint
{
	return CGPointMake(self.boundsMinX, self.boundsMinY);
}

- (void)setBoundsTopLeftPoint:(CGPoint)boundsTopLeftPoint
{
	self.boundsMinX = boundsTopLeftPoint.x;
	self.boundsMinY = boundsTopLeftPoint.y;
}

- (CGPoint)boundsTopMiddlePoint
{
	return CGPointMake(self.boundsMidX, self.boundsMinY);
}

- (void)setBoundsTopMiddlePoint:(CGPoint)boundsTopMiddlePoint
{
	self.boundsMidX = boundsTopMiddlePoint.x;
	self.boundsMinY = boundsTopMiddlePoint.y;
}

- (CGPoint)boundsTopRightPoint
{
	return CGPointMake(self.boundsMaxX, self.boundsMinY);
}

- (void)setBoundsTopRightPoint:(CGPoint)boundsTopRightPoint
{
	self.boundsMaxX = boundsTopRightPoint.x;
	self.boundsMinY = boundsTopRightPoint.y;
}

- (CGPoint)boundsMiddleRightPoint
{
	return CGPointMake(self.boundsMaxX, self.boundsMidY);
}

- (void)setBoundsMiddleRightPoint:(CGPoint)boundsMiddleRightPoint
{
	self.boundsMaxX = boundsMiddleRightPoint.x;
	self.boundsMidY = boundsMiddleRightPoint.y;
}

- (CGPoint)boundsBottomRightPoint
{
	return CGPointMake(self.boundsMaxX, self.boundsMaxY);
}

- (void)setBoundsBottomRightPoint:(CGPoint)boundsBottomRightPoint
{
	self.boundsMaxX = boundsBottomRightPoint.x;
	self.boundsMaxY = boundsBottomRightPoint.y;
}

- (CGPoint)boundsBottomMiddlePoint
{
	return CGPointMake(self.boundsMidX, self.boundsMaxY);
}

- (void)setBoundsBottomMiddlePoint:(CGPoint)boundsBottomMiddlePoint
{
	self.boundsMidX = boundsBottomMiddlePoint.x;
	self.boundsMaxY = boundsBottomMiddlePoint.y;
}

- (CGPoint)boundsBottomLeftPoint
{
	return CGPointMake(self.boundsMinX, self.boundsMaxY);
}

- (void)setBoundsBottomLeftPoint:(CGPoint)boundsBottomLeftPoint
{
	self.boundsMinX = boundsBottomLeftPoint.x;
	self.boundsMaxY = boundsBottomLeftPoint.y;
}

- (CGPoint)boundsMiddleLeftPoint
{
	return CGPointMake(self.boundsMinX, self.boundsMidY);
}

- (void)setBoundsMiddleLeftPoint:(CGPoint)boundsMiddleLeftPoint
{
	self.boundsMinX = boundsMiddleLeftPoint.x;
	self.boundsMidY = boundsMiddleLeftPoint.y;
}

@end