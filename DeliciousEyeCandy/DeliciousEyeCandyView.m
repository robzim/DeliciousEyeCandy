//
//  DeliciousEyeCandyView.m
//  DeliciousEyeCandy
//
//  Created by Robert Zimmelman on 5/29/17.
//  Copyright © 2017 Robert Zimmelman. All rights reserved.
//

#import "DeliciousEyeCandyView.h"

@implementation DeliciousEyeCandyView
@synthesize myImage;
@synthesize myRect;
@synthesize mySize;
@synthesize myRectLocation;
@synthesize myRandomColor;
@synthesize myMoveToPoint;
@synthesize myControlPoint1;
@synthesize myControlPoint2;
@synthesize myPath;
@synthesize myWigglyPath;
@synthesize myMethod;
//@synthesize mySpriteKitView;
//@synthesize mySpriteKitScene;
//@synthesize mySprite;
@synthesize myEndPoint;
@synthesize myColor;

float myRandomRed;
float myRandomGreen;
float myRandomBlue;
int myMoveToX;
int myMoveToY;

int myFrameCount;

int myFrameSwitchStep = 5000;
//int myFrameSwitchStep = 50;
int myStepStrokeStep = 50;

BOOL myFirstWiggly = YES;


-(void)myGenerateSaturatedRandomColor{
    int myColorToClamp = SSRandomIntBetween(1, 6);
    myRandomRed = SSRandomFloatBetween(0.8, 1.0);
    myRandomGreen = SSRandomFloatBetween(0.8, 1.0);
    myRandomBlue = SSRandomFloatBetween(0.8, 1.0);
    switch (myColorToClamp) {
        case 1:
            myRandomRed=0.0;
            break;
        case 2:
            myRandomGreen=0.0;
            break;
        case 3:
            myRandomBlue=0.0;
            break;
        case 4:
            myRandomRed=0.0;
            myRandomGreen=0.0;
            break;
        case 5:
            myRandomRed=0.0;
            myRandomBlue=0.0;
            break;
        case 6:
            myRandomGreen=0.0;
            myRandomBlue=0.0;
            break;
        default:
            break;
    }
    
    myColor = [NSColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0];
}

-(void)myGenerateRandomColor: (BOOL) theColorSwitch{
    //    NSColor *theColor;
    
    myRandomRed = SSRandomFloatBetween(0, 1.0);
    if (theColorSwitch) {
        myRandomGreen = SSRandomFloatBetween(0, 1.0);
        myRandomBlue = SSRandomFloatBetween(0, 1.0);
    }
    else {
        myRandomGreen = myRandomRed;
        myRandomBlue = myRandomRed;
    }
    myColor = [NSColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0];
    //    return theColor;
}



- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1.0/24.0];
//        [self setAnimationTimeInterval:3.0/1.0];
    }
    
    //    myRect = NSMakeRect(0.0, 0.0, 10.0, 10.0);
    //    myRectLocation = NSMakePoint(1.0, 1.0);
    //    myImage = [NSImage imageNamed:@"EyeCandy01.png"];
    mySize = self.bounds.size;
    NSPoint myPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    //    myPath = [[NSBezierPath alloc] init];
    // set myEndPoint to a starting position for the myMakeStroke method
    myFrameCount = 0;
    myEndPoint = myPoint;
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    
    //    myRandomColor = [self myGenerateRandomColor];
    //    [myRandomColor set];
    //    NSRectFill(myRect);
}

-(void)myMakeRectInRect{
    NSRect SSCenteredRectInRect(NSRect innerRect, NSRect outerRect);
}

-(void)myMakeBWStraightLine{
    myPath = [NSBezierPath bezierPath];
    [myPath moveToPoint:myEndPoint];
    myMoveToPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath lineToPoint:myMoveToPoint];
    [self myGenerateRandomColor:NO];
    [myPath setLineWidth:SSRandomFloatBetween(1.0, 10.0)];
    [myColor set];
    [myPath stroke];
    myEndPoint = myMoveToPoint;
}

-(void)myMakeColoredStraightLine{
    myPath = [NSBezierPath bezierPath];
    [myPath moveToPoint:myEndPoint];
    myMoveToPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath lineToPoint:myMoveToPoint];
//    [self myGenerateRandomColor:YES];
    [self myGenerateSaturatedRandomColor];
    [myPath setLineWidth:SSRandomFloatBetween(1.0, 10.0)];
    //boost a random color
    [myColor set];
    [myPath stroke];
    myEndPoint = myMoveToPoint;
}


-(void)myMakeBWStroke{
    myPath = [NSBezierPath bezierPath];
    [myPath moveToPoint:myEndPoint];
    //    NSLog(@"Starting X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    //    NSPoint myMoveToPoint;
    //    NSPoint myControlPoint1;
    //    NSPoint myControlPoint2;
    myMoveToPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath curveToPoint:myMoveToPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    [self myGenerateRandomColor:NO];
    //    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 10.0);
    [myPath setLineWidth:SSRandomFloatBetween(1.0, 10.0)];
    [myColor set];
    [myPath stroke];
    myEndPoint = myMoveToPoint;
}

-(void)myMakeColoredStroke{
    myPath = [NSBezierPath bezierPath];
    [myPath setLineJoinStyle:NSRoundLineJoinStyle];
    [myPath moveToPoint:myEndPoint];
    //    NSLog(@"Starting X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    //    NSPoint myMoveToPoint;
    //    NSPoint myControlPoint1;
    //    NSPoint myControlPoint2;
    myMoveToPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath curveToPoint:myMoveToPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    [self myGenerateRandomColor:YES];
    //    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 10.0);
    [myPath setLineWidth:SSRandomFloatBetween(1.0, 10.0)];
    [myColor set];
    [myPath stroke];
    myEndPoint = myMoveToPoint;
}



-(void)myBlankTheScreen{
    NSRect myBlankingRect =   NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height);
    NSBezierPath *myBlankingPath = [NSBezierPath bezierPathWithRect:myBlankingRect];
    [[NSColor blackColor] set];
    [myBlankingPath fill];
}

-(void)myMakeLoopedRandomWalkArcShape{
    mySize = self.bounds.size;
    myPath = [NSBezierPath bezierPath];
    [myPath setLineJoinStyle:NSRoundLineJoinStyle];
    NSPoint myPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath moveToPoint:myPoint];
    NSLog(@"Starting X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    int myRandomLoopNumber = SSRandomIntBetween(4, 50);
//    NSPoint myMoveToPoint;
//    NSPoint myControlPoint1;
//    NSPoint myControlPoint2;
    for (int i = 0 ; i < myRandomLoopNumber; i++) {
        myMoveToPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
        myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
        myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
        [myPath curveToPoint:myMoveToPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    }
    myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath curveToPoint:myPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    NSLog(@"After Moving To Origin X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    [myPath closePath];
    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 10.0);
    [myPath setLineWidth:myRandomLineWidth];
    [self myGenerateRandomColor:YES];
    [myColor set];
    [myPath fill];
    [self myGenerateRandomColor:YES];
    //    int myStrokeOrFill = arc4random()%2;
    //    if (myStrokeOrFill == 0) {
    // then draw the shape
    [myColor set];
    [myPath stroke];
    
    //    }
}

-(void)myMakeWigglyShape{
    if (myFirstWiggly) {
        // set up the shape by making the first path
        // on subsequent iterations we'll modify the points on the path
        // slightly each iteration
        mySize = self.bounds.size;
        myWigglyPath = [NSBezierPath bezierPath];
        [myWigglyPath setLineJoinStyle:NSRoundLineJoinStyle];
        NSPoint myPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
        [myWigglyPath moveToPoint:myPoint];
        NSLog(@"Starting X %f  Y %f",myWigglyPath.currentPoint.x,myWigglyPath.currentPoint.y);
        int myRandomLoopNumber = SSRandomIntBetween(4, 50);
//        NSPoint myMoveToPoint;
//        NSPoint myControlPoint1;
//        NSPoint myControlPoint2;
        for (int i = 0 ; i < myRandomLoopNumber; i++) {
            myMoveToPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
            myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
            myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
            [myWigglyPath curveToPoint:myMoveToPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
        }
        myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
        myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
        [myWigglyPath curveToPoint:myPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
        NSLog(@"After Moving To Origin X %f  Y %f",myWigglyPath.currentPoint.x,myWigglyPath.currentPoint.y);
        [myWigglyPath closePath];
        CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 10.0);
        [myWigglyPath setLineWidth:myRandomLineWidth];
        [self myGenerateRandomColor:YES];
        [myColor set];
        [myWigglyPath fill];
        [self myGenerateRandomColor:YES];
        //    int myStrokeOrFill = arc4random()%2;
        //    if (myStrokeOrFill == 0) {
        // then draw the shape
        [myColor set];
        [myWigglyPath stroke];
        
        myFirstWiggly = NO;
    } else
        // lets transform the path to make it 'wiggly' ??????
//        NSBezierPath *myNewPath = [NSBezierPa
        
                                   
        
    {
        // iterate through the nodes in the bezier path
        for (int i = 0 ; i < myWigglyPath.elementCount; i++){
            
            
            
            
//            NSPointArray myPointArray[10];
            
//            NSBezierPathElement myPathElement = [myWigglyPath elementAtIndex:i associatedPoints:myPointArray];

            
            
            
            
            
            
//
//            NSLog(@"Path Node %d = %@",i, (NSBezierPathElement *) [myWigglyPath elementAtIndex:i] );
        }
        
    }
    
    //    }
}




- (void)animateOneFrame
//
//
//   WORK ON THE WIGGLY SHAPE!!!!!
//
//

{
    myFrameCount++;
    if ((myFrameCount % myFrameSwitchStep ) == 0) {
        [self setNeedsDisplay:YES];
    }
    if (myFrameCount < myFrameSwitchStep) {
//        [self myMakeWigglyShape];
                [self myMakeStepLineShape];
    }
    else if (myFrameCount < (myFrameSwitchStep * 2)) {
        [self myMakeLoopedRandomWalkArcShape];
    }
    else if (myFrameCount < (myFrameSwitchStep * 3)) {
        [self myMakeColoredStroke];
    }
    else if (myFrameCount < (myFrameSwitchStep * 4)) {
        [self myMakeRandomShapes];
    }
    else if (myFrameCount < (myFrameSwitchStep * 5)) {
        [self myMakeRects:20.0];
    }
    else if (myFrameCount < (myFrameSwitchStep * 6)) {
//        [self myMakeRandomWalkArcShape];
                [self myMakeStepLineShape];
    }
    else if (myFrameCount < (myFrameSwitchStep * 7)) {
        [self myNewMakeRandomWalkShape];
    }
    else if (myFrameCount < (myFrameSwitchStep * 8)) {
        [self myMakeBWStraightLine];
    }
    else if (myFrameCount < (myFrameSwitchStep * 9)) {
//        [self myMakeColoredStraightLine];
        [self myMakeRandomWalkArcShape];
    }
    else if (myFrameCount < (myFrameSwitchStep * 10)) {
        [self myMakeBWStroke];
    }
    else if (myFrameCount < (myFrameSwitchStep * 11)) {
        [self myMakeColoredStraightLine];
        
//        [self myMakeWigglyShape];
    }
    else if (myFrameCount >= (myFrameSwitchStep * 11)) {
        myFrameCount = 0;
    }
    return;
}


- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

-(void)myMakeStepLineShape{
    [myColor set];
    myPath = [NSBezierPath bezierPath];
        myMoveToX = SSRandomIntBetween(0, 1);
        if (myMoveToX == 0) {
            myMoveToX = -1;
        }
        myMoveToY = SSRandomIntBetween(0, 1);
        if (myMoveToY == 0) {
            myMoveToY = -1;
        }
    myMoveToPoint = NSMakePoint(myEndPoint.x + (myMoveToX * myStepStrokeStep), myEndPoint.y + (myMoveToY*myStepStrokeStep));
    if (  myMoveToPoint.x >= (self.bounds.size.width - myStepStrokeStep) ) myMoveToPoint = myEndPoint;
    if (  myMoveToPoint.x <= 10 ) myMoveToPoint = myEndPoint;
    if (  myMoveToPoint.y >= (self.bounds.size.height - myStepStrokeStep) ) myMoveToPoint = myEndPoint;
    if (  myMoveToPoint.y <= 10 ) myMoveToPoint = myEndPoint;
    [self myGenerateRandomColor:NO];
    float myLineWidth = SSRandomFloatBetween(10.0, 15.0);
    float myCircleRadius = SSRandomFloatBetween(1.0, 10.0);
    // stamp a circle to cover the last line
    [myPath moveToPoint:myEndPoint];
    [myPath setLineWidth:myLineWidth];
    [myPath appendBezierPathWithArcWithCenter:myEndPoint radius:myCircleRadius startAngle:0.0 endAngle:360.0];    [myPath stroke];
    [myPath fill];
    [myPath moveToPoint:myEndPoint];
    [myPath lineToPoint:myMoveToPoint];
//    [myPath appendBezierPathWithArcWithCenter:myMoveToPoint radius:myCircleRadius startAngle:0.0 endAngle:360.0];
    [myPath stroke];
    myEndPoint = myMoveToPoint;
}

-(void)myMakeRandomWalkArcShape{
    mySize = self.bounds.size;
    myPath = [NSBezierPath bezierPath];
    [myPath setLineJoinStyle:NSRoundLineJoinStyle];
    [myPath setLineCapStyle:NSRoundLineCapStyle];
    NSPoint myPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath moveToPoint:myPoint];
    NSLog(@"Starting X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    float myMoveToY = myPoint.y + (arc4random()%200);
    [self myMakeNewRandomControlPoints];
    [myPath curveToPoint:NSMakePoint(myPath.currentPoint.x, myMoveToY) controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    NSLog(@"After Moving Up X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    float myMoveToX = myPoint.x - (arc4random()%200);
    [self myMakeNewRandomControlPoints];
    [myPath curveToPoint:NSMakePoint(myMoveToX,myPath.currentPoint.y) controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    NSLog(@"After Moving Left X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    myMoveToY = myPoint.y - (arc4random()%200);
    [self myMakeNewRandomControlPoints];
    [myPath curveToPoint:NSMakePoint(myPath.currentPoint.x, myMoveToY) controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    NSLog(@"After Moving Down X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    [self myMakeNewRandomControlPoints];
    [myPath curveToPoint:myPoint controlPoint1:myControlPoint1 controlPoint2:myControlPoint2];
    NSLog(@"After Moving To Origin X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    [myPath closePath];
    NSLog(@"After Closing Path X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 10.0);
    [myPath setLineWidth:myRandomLineWidth];
    [self myGenerateRandomColor:YES];
    [myColor set];
    [myPath fill];
    [self myGenerateRandomColor:YES];
//    int myStrokeOrFill = arc4random()%2;
    int myStrokeOrFill=0;
    if (myStrokeOrFill == 0) {
        // then draw the shape
        [myColor set];
        [myPath stroke];
    }
    
}

-(void)myMakeNewRandomControlPoints{
    myControlPoint1 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    myControlPoint2 = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
}


-(void)myMakeRandomShapes{
    int myRandomShape;
    mySize = self.bounds.size;
    float myRandomXSize = SSRandomFloatBetween(1.0, mySize.width/10.0);
    float myRandomYSize = SSRandomFloatBetween(1.0, mySize.height/10.0);
    myRect = NSMakeRect(0.0,0.0,myRandomXSize,myRandomYSize);
    myRect.origin = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 20.0);
    myRandomShape = SSRandomIntBetween(0, 1);
    if (myRandomShape == 1) {
        myPath = [NSBezierPath bezierPathWithRect:myRect];
    } else {
        myPath = [NSBezierPath bezierPathWithOvalInRect:myRect];
    }
    [myPath setLineWidth:myRandomLineWidth];
    float myRandomRed = SSRandomFloatBetween(0, 1.0);
    float myRandomGreen = SSRandomFloatBetween(0, 1.0);
    float myRandomBlue = SSRandomFloatBetween(0, 1.0);
    myColor = [NSColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0];
    [myColor set];
    [myPath stroke];
}

-(void)myMakeRects: (float) theRectSize {
    myRect = NSMakeRect(0.0,0.0,theRectSize,theRectSize);
    myRect.origin = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 5.0);
    myPath = [NSBezierPath bezierPathWithRect:myRect];
    [myPath setLineWidth:myRandomLineWidth];
    float myRandomRed = SSRandomFloatBetween(0, 1.0);
    float myRandomGreen = SSRandomFloatBetween(0, 1.0);
    float myRandomBlue = SSRandomFloatBetween(0, 1.0);
    float myRandomAlpha = SSRandomFloatBetween(0.0, 1.0);
    myColor = [NSColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:myRandomAlpha];
    [myColor set];
    [myPath stroke];
}

-(void)myNewMakeRandomWalkShape{
    mySize = self.bounds.size;
//    NSBezierPath *myPath = [NSBezierPath bezierPath];
    NSPoint myPoint = SSRandomPointForSizeWithinRect( myRect.size, [self bounds] );
    [myPath moveToPoint:myPoint];
    float myMoveToY = myPoint.y + (arc4random()%200);
    [myPath lineToPoint:NSMakePoint(myPath.currentPoint.x, myMoveToY)];
    NSLog(@"After Moving Up X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    float myMoveToX = myPoint.x - (arc4random()%200);
    [myPath lineToPoint:NSMakePoint(myMoveToX,myPath.currentPoint.y)];
    NSLog(@"After Moving Left X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    myMoveToY = myPoint.y - (arc4random()%200);
    [myPath lineToPoint:NSMakePoint(myPath.currentPoint.x, myMoveToY)];
    NSLog(@"After Moving Down X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    [myPath closePath];
    NSLog(@"After Closing Path X %f  Y %f",myPath.currentPoint.x,myPath.currentPoint.y);
    CGFloat myRandomLineWidth = SSRandomFloatBetween(1.0, 10.0);
    [myPath setLineWidth:myRandomLineWidth];
    [self myGenerateRandomColor:YES];
    [myColor set];
    int myStrokeOrFill = arc4random()%2;
    if (myStrokeOrFill == 0) {
        // then draw the shape
        [myPath stroke];
    } else if (myStrokeOrFill == 1) {
        // then fill the shape
        [myPath fill];
    }
}

@end
