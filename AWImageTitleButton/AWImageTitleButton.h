//
//  AWImageTitleButton.h
//  AWImageTitleButtonDemo
//
//  Created by kitwee on 17/12/28.
//  Copyright © 2017年 Alex Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AWImageTitleButtonStyle) {
    /*
     -------------------
     -   Image  Title  -
     -------------------
     */
    AWButtonStyleImageLeftTitleRight = 0, //default style
    AWButtonStyleTitleLeftImageRight,
    
    AWButtonStyleImageTopTitleBottom,
    AWButtonStyleTitleTopImageBottom,

    
    AWButtonStyleImageLeftTitleRightLeft,
    AWButtonStyleImageLeftTitleRightCenter,
    
    AWButtonStyleTitleLeftImageRightCenter,
    AWButtonStyleTitleLeftImageRightLeft,
    
    AWButtonStyleFitTitleLeftImageRight,
};

@interface AWImageTitleButton : UIButton

@property (nonatomic, assign) UIEdgeInsets margin;
@property (nonatomic, assign) CGSize padding;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) AWImageTitleButtonStyle style;

//If there is no parameter, use the default parameters
//default style, margin:UIEdgeInsetsZero, padding:CGSizeMake(2, 2)

- (instancetype)init;

- (instancetype)initWithStyle:(AWImageTitleButtonStyle)style;

- (instancetype)initWithStyle:(AWImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin;

- (instancetype)initWithStyle:(AWImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin padding:(CGSize)padding;
@end
