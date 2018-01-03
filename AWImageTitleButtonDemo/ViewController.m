//
//  ViewController.m
//  AWImageTitleButtonDemo
//
//  Created by kitwee on 17/12/28.
//  Copyright © 2017年 Alex Wong. All rights reserved.
//

#import "ViewController.h"
#import "AWImageTitleButton.h"


/**
 //按钮内容整体偏移(图片➕文字)
 _btn_.margin
 //调整图片大小.默认为图片自身大小
 _btn_.imageSize
 //调整图片和文字之间的距离
 _btn_.padding
 */
#define configBtn(_btn_,_style_,_btn2_) -(AWImageTitleButton *)_btn2_{\
if (_btn_ == nil) {\
    _btn_ = [[AWImageTitleButton alloc] initWithStyle:_style_];\
    _btn_.backgroundColor = [UIColor grayColor];\
    [_btn_ setTitle:@"按钮文字" forState:UIControlStateNormal];\
    [_btn_.titleLabel setFont:[UIFont systemFontOfSize:14]];\
    _btn_.titleLabel.backgroundColor = [UIColor lightGrayColor];\
    [_btn_ setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];\
    _btn_.titleLabel.textAlignment = NSTextAlignmentCenter;\
    [_btn_ setImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];\
    _btn_.margin = UIEdgeInsetsZero;\
    _btn_.padding = CGSizeMake(0, 0);\
}\
return _btn_;\
}\

#define kButtonW 150
#define kButtonH 50
#define kRowMargin 20
#define kColMargin 20
#define kX 20
#define kY 50

@interface ViewController ()
@property (nonatomic, strong) AWImageTitleButton *ImageLeftTitleRightBtn;
@property (nonatomic, strong) AWImageTitleButton *TitleLeftImageRightBtn;

@property (nonatomic, strong) AWImageTitleButton *ImageTopTitleBottomBtn;
@property (nonatomic, strong) AWImageTitleButton *TitleTopImageBottomBtn;

@property (nonatomic, strong) AWImageTitleButton *ImageLeftTitleRightLeftBtn;
@property (nonatomic, strong) AWImageTitleButton *TitleLeftImageRightLeftBtn;

@property (nonatomic, strong) AWImageTitleButton *ImageLeftTitleRightCenterBtn;
@property (nonatomic, strong) AWImageTitleButton *TitleLeftImageRightCenterBtn;

@property (nonatomic, strong) AWImageTitleButton *FitTitleLeftImageRightBtn;

@end

@implementation ViewController
#pragma mark -
#pragma mark -life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addOwnViews];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self relayoutSubviews];
    
}
#pragma mark -
#pragma mark -private method
- (void)addOwnViews{
    [self.view addSubview:self.ImageLeftTitleRightBtn];
    [self.view addSubview:self.TitleLeftImageRightBtn];
    
    [self.view addSubview:self.ImageTopTitleBottomBtn];
    [self.view addSubview:self.TitleTopImageBottomBtn];
    
    [self.view addSubview:self.ImageLeftTitleRightLeftBtn];
    [self.view addSubview:self.TitleLeftImageRightLeftBtn];
    
    [self.view addSubview:self.ImageLeftTitleRightCenterBtn];
    [self.view addSubview:self.TitleLeftImageRightCenterBtn];
    
    [self.view addSubview:self.FitTitleLeftImageRightBtn];
    
    [self configOwnViews];
}

- (void)configOwnViews{
   
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)relayoutSubviews{
    
    _ImageLeftTitleRightBtn.frame = CGRectMake(kX, kY, kButtonW, kButtonH);
    _TitleLeftImageRightBtn.frame = CGRectOffset(_ImageLeftTitleRightBtn.frame, _ImageLeftTitleRightBtn.frame.size.width+kRowMargin, 0);
    
    _ImageTopTitleBottomBtn.frame = CGRectOffset(_ImageLeftTitleRightBtn.frame, 0, _ImageLeftTitleRightBtn.frame.size.height+kRowMargin);
    _TitleTopImageBottomBtn.frame = CGRectOffset(_ImageTopTitleBottomBtn.frame, _ImageTopTitleBottomBtn.frame.size.width+kRowMargin, 0);
    
    _ImageLeftTitleRightLeftBtn.frame =  CGRectOffset(_ImageTopTitleBottomBtn.frame, 0, _ImageTopTitleBottomBtn.frame.size.height+kRowMargin);
    _ImageLeftTitleRightCenterBtn.frame = CGRectOffset(_ImageLeftTitleRightLeftBtn.frame, _ImageLeftTitleRightLeftBtn.frame.size.width+kRowMargin, 0);
    
    _TitleLeftImageRightLeftBtn.frame = CGRectOffset(_ImageLeftTitleRightLeftBtn.frame, 0, _ImageLeftTitleRightLeftBtn.frame.size.height+kRowMargin);
    _TitleLeftImageRightCenterBtn.frame = CGRectOffset(_TitleLeftImageRightLeftBtn.frame, _TitleLeftImageRightLeftBtn.frame.size.width+kRowMargin, 0);
    
    _FitTitleLeftImageRightBtn.frame = CGRectOffset(_TitleLeftImageRightLeftBtn.frame, 0, _TitleLeftImageRightLeftBtn.frame.size.height+kRowMargin);
}

#pragma mark -
#pragma mark -set/get
configBtn(_ImageLeftTitleRightBtn, AWButtonStyleImageLeftTitleRight,ImageLeftTitleRightBtn)
configBtn(_TitleLeftImageRightBtn, AWButtonStyleTitleLeftImageRight,TitleLeftImageRightBtn)

configBtn(_ImageTopTitleBottomBtn, AWButtonStyleImageTopTitleBottom,ImageTopTitleBottomBtn)
configBtn(_TitleTopImageBottomBtn, AWButtonStyleTitleTopImageBottom,TitleTopImageBottomBtn)

configBtn(_ImageLeftTitleRightLeftBtn, AWButtonStyleImageLeftTitleRightLeft,ImageLeftTitleRightLeftBtn)
configBtn(_ImageLeftTitleRightCenterBtn, AWButtonStyleImageLeftTitleRightCenter,ImageLeftTitleRightCenterBtn)

configBtn(_TitleLeftImageRightLeftBtn, AWButtonStyleTitleLeftImageRightLeft,TitleLeftImageRightLeftBtn)
configBtn(_TitleLeftImageRightCenterBtn, AWButtonStyleTitleLeftImageRightCenter,TitleLeftImageRightCenterBtn)

configBtn(_FitTitleLeftImageRightBtn, AWButtonStyleFitTitleLeftImageRight,FitTitleLeftImageRightBtn)

#pragma mark -
#pragma mark -system
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
