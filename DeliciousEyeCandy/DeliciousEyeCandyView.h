//
//  DeliciousEyeCandyView.h
//  DeliciousEyeCandy
//
//  Created by Robert Zimmelman on 5/29/17.
//  Copyright © 2017 Robert Zimmelman. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
//@import SpriteKit;

@interface DeliciousEyeCandyView : ScreenSaverView;
//@property SKView *mySpriteKitView;
//@property SKScene *mySpriteKitScene;
//@property SKSpriteNode *mySprite;


@property NSImage *myImage;
@property NSRect myRect;
@property NSSize mySize;
@property NSPoint myRectLocation;
@property NSColor *myRandomColor;
@property NSColor *myColor;
@property NSPoint myEndPoint;

@property NSPoint myMoveToPoint;
@property NSPoint myControlPoint1;
@property NSPoint myControlPoint2;
@property NSBezierPath *myPath;
@property NSBezierPath *myWigglyPath;
@property NSString *myMethod;
@end
