//
//  AWImageTitleButton.m
//  AWImageTitleButtonDemo
//
//  Created by kitwee on 17/12/28.
//  Copyright © 2017年 Alex Wong. All rights reserved.
//

#import "AWImageTitleButton.h"

@implementation AWImageTitleButton

#pragma mark -
#pragma mark -init
- (instancetype)init{
    return [self initWithStyle:AWButtonStyleImageLeftTitleRight];
}

- (instancetype)initWithStyle:(AWImageTitleButtonStyle)style{
    return [self initWithStyle:style maggin:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (instancetype)initWithStyle:(AWImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin{
    return [self initWithStyle:style maggin:margin padding:CGSizeMake(2, 2)];
}

- (instancetype)initWithStyle:(AWImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin padding:(CGSize)padding{
    
    if (self = [super initWithFrame:CGRectZero]){
        _style = style;
        _margin = margin;
        _padding = padding;
    }
    return self;
}

#pragma mark - override
- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    if (image && CGSizeEqualToSize(_imageSize, CGSizeZero)){
        _imageSize = image.size;
    }
}

- (void)layoutSubviews{
    if (CGRectEqualToRect(self.bounds, CGRectZero)){
        return;
    }
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}


#pragma mark - set/get
- (void)setMargin:(UIEdgeInsets)margin{
    _margin = margin;
    [self setNeedsDisplay];
}

- (void)setPadding:(CGSize)padding{
    _padding = padding;
    [self setNeedsDisplay];
}


#pragma mark - private medthod
- (void)relayoutFrameOfSubViews{
    CGRect rect = self.bounds;
    
    rect.origin.x += _margin.left;
    rect.size.width -= _margin.left + _margin.right;
    rect.origin.y += _margin.top;
    rect.size.height -= _margin.top + _margin.bottom;
    
    UIImage *img = [self imageForState:UIControlStateNormal];
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CGSize size = CGSizeZero;
    
    if (CGSizeEqualToSize(self.imageSize, CGSizeZero)){
        size = CGSizeMake(img.size.width/scale, img.size.height/scale);
    }
    else{
        size = self.imageSize;
    }
    
    switch (_style)
    {
        case AWButtonStyleImageTopTitleBottom:{
            CGRect imgRect = rect;
            imgRect.size.height = size.height;
            imgRect.origin.x += (imgRect.size.width - size.width)/2;
            imgRect.size.width = size.width;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.origin.y += imgRect.size.height + _padding.height;
            titleRect.size.height -= imgRect.size.height + _padding.height;
            self.titleLabel.frame = titleRect;
        }
            break;
        case AWButtonStyleTitleTopImageBottom:{
            CGRect imgRect = rect;
            imgRect.origin.x += (imgRect.size.width - size.width)/2;
            imgRect.size.width = size.width;
            imgRect.size.height = size.height;
            imgRect.origin.y += rect.size.height - imgRect.size.height;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.size.height -= imgRect.size.height + _padding.height;
            self.titleLabel.frame = titleRect;
        }
            break;
        case AWButtonStyleImageLeftTitleRight:{
            CGRect imgRect = rect;
            imgRect.size.width = size.width;
            imgRect.size.height = size.height;
            imgRect.origin.y += (rect.size.height - size.height)/2;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.origin.x += imgRect.size.width + _padding.width;
            titleRect.size.width -= imgRect.size.width + _padding.width;
            self.titleLabel.frame = titleRect;
        }
            break;
        case AWButtonStyleTitleLeftImageRight:{
            CGRect imgRect = rect;
            imgRect.size.width = size.width;
            imgRect.origin.x += rect.size.width - imgRect.size.width;
            imgRect.size.height = size.height;
            imgRect.origin.y += (rect.size.height - size.height)/2;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.size.width -= imgRect.size.width + _padding.width;
            self.titleLabel.frame = titleRect;
        }
            break;
        case AWButtonStyleImageLeftTitleRightLeft:{
            CGRect imgRect = rect;
            imgRect.size = self.imageSize;
            imgRect.origin.y += (rect.size.height - imgRect.size.height)/2;
            self.imageView.frame = imgRect;
            
            rect.origin.x += imgRect.size.width + self.padding.width;
            rect.size.width -= imgRect.size.width + self.padding.width;
            self.titleLabel.textAlignment = NSTextAlignmentLeft;
            self.titleLabel.frame = rect;
        }
            break;
            
        case AWButtonStyleTitleLeftImageRightLeft:{
            CGRect imgRect = rect;
            imgRect.size = self.imageSize;
            imgRect.origin.y += (rect.size.height - imgRect.size.height)/2;
            imgRect.origin.x += rect.size.width - (imgRect.size.width + self.padding.width);
            self.imageView.frame = imgRect;
            
            rect.size.width -= imgRect.size.width + self.padding.width;
            
            self.titleLabel.frame = rect;
        }
            break;
            
        case AWButtonStyleImageLeftTitleRightCenter:{
            
            CGSize titleSize = [self textSizeIn:rect.size];
            
            CGRect middleRect = CGRectInset(rect, (rect.size.width - (titleSize.width + self.imageSize.width + self.padding.width))/2, 0);
            
            CGRect imgRect = middleRect;
            
            imgRect.size = self.imageSize;
            imgRect.origin.y += (middleRect.size.height - imgRect.size.height)/2;
            self.imageView.frame = imgRect;
            
            middleRect.origin.x += imgRect.size.width + self.padding.width;
            middleRect.size.width -= imgRect.size.width + self.padding.width;
            
            self.titleLabel.frame = middleRect;
            
            
        }
            break;
            
        case AWButtonStyleTitleLeftImageRightCenter:{
            CGSize titleSize = [self textSizeIn:rect.size];
            
            CGRect middleRect = CGRectInset(rect, (rect.size.width - (titleSize.width + self.imageSize.width + self.padding.width))/2, 0);
            
            CGRect titlerect = middleRect;
            titlerect.size.width = titleSize.width;
            self.titleLabel.frame = titlerect;
            
            middleRect.origin.x += titlerect.size.width + self.padding.width;
            middleRect.size.width -= titlerect.size.width + self.padding.width;
            
            middleRect.origin.y += (middleRect.size.height - self.imageSize.height)/2;
            middleRect.size = self.imageSize;
            self.imageView.frame = middleRect;
        }
            break;
        case AWButtonStyleFitTitleLeftImageRight:{
            CGSize titleSize = [self textSizeIn:rect.size];
            CGRect titleRect = rect;
            
            titleRect.origin.y = rect.origin.y + (rect.size.height - titleSize.height)/2;
            titleRect.size = titleSize;
            self.titleLabel.frame = titleRect;
            
            titleRect.origin.x += titleRect.size.width + self.padding.width;
            titleRect.size = self.imageSize;
            titleRect.origin.y = rect.origin.y + (rect.size.height - self.imageSize.height)/2;
            self.imageView.frame = titleRect;
            
            break;
        }
            break;
            
        default:
            break;
    }
}

- (CGSize)textSizeIn:(CGSize)size{
    
    NSLineBreakMode breakMode = self.titleLabel.lineBreakMode;
    UIFont *font = self.titleLabel.font;
    
    CGSize contentSize = CGSizeZero;

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = breakMode;
    paragraphStyle.alignment = self.titleLabel.textAlignment;
    
    NSDictionary* attributes = @{NSFontAttributeName:font,
                       NSParagraphStyleAttributeName:paragraphStyle};
    contentSize = [self.titleLabel.text boundingRectWithSize:size
                                                     options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                                  attributes:attributes
                                                     context:nil].size;
    
    contentSize = CGSizeMake((int)contentSize.width + 1, (int)contentSize.height + 1);
    return contentSize;
}

@end
