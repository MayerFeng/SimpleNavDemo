//
//  MMButton.m
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import "MMButton.h"
#import "UIView+Frame.h"
#import "UILabel+Calculate.h"

@interface MMButton ()
@property (nonatomic, assign) CGFloat minWidth;
@property (nonatomic, assign) CGFloat minHeight;  
@end

@implementation MMButton


- (instancetype)initWithFrame:(CGRect)frame
                   imageStyle:(MMBtnImageStyle)imageStyle
                  layoutStyle:(MMBtnLayoutStyle)layoutStyle
                         font:(UIFont *)font
                        title:(NSString *)title
                        image:(UIImage *)image
                        space:(CGFloat)space
                       offset:(CGFloat)margin
                     autoSize:(BOOL)autoSize{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageStyle = imageStyle;
        self.layoutStyle = layoutStyle;
        self.space = space;
        self.offsetMargin = margin;
        self.autoSize = autoSize;
        self.minWidth = frame.size.width;
        self.minHeight = frame.size.height;
        if (font) {
            self.titleLabel.font = font;
            self.titleLabel.backgroundColor = [UIColor redColor];
        }
        if (image) {
            [self setImage:image forState:UIControlStateNormal];
          
        }
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
//        self.backgroundColor = [UIColor yellowColor];
        [self layoutBtnSubviews]; //布局uibutton的子视图
    }
    return self;

    
}
- (void)layoutBtnSubviews{
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.titleLabel getSize];
    
    CGFloat maxWidth = (imageSize.width > titleSize.width) ? imageSize.width : titleSize.width;
    
    CGFloat maxHeight = (imageSize.height > titleSize.height) ? imageSize.height : titleSize.height;
    
    CGRect tempFrame = self.frame;
    
    CGFloat autoWidth = self.frame.size.width;
    CGFloat autoHeight = self.frame.size.height;
    
    
    switch (self.imageStyle)
    {
        case MMBtnImageStyleDefault: //从图片角度 左 右 上 下
        {
            switch (self.layoutStyle) //按钮的方向  整体漂移的方向
            {
                case MMBtnLayoutStyleNone:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight);
                    if (_autoSize) //默认是自适应
                        
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _space / 2.0, 0, -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_space / 2.0, 0, _space / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleLeft:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX =  (autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  -offsetX + _space, 0,  offsetX - _space)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -offsetX, 0, offsetX)];
                }
                    break;
                case MMBtnLayoutStyleRight:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = - ((autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -offsetX, 0, offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -offsetX - _space, 0, offsetX + _space)];
                }
                    break;
                case MMBtnLayoutStyleTop:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight + _offsetMargin;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = (autoHeight - maxHeight) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY , _space / 2.0, offsetY,  -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY,  -_space / 2.0, offsetY, _space / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleBottom:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight + _offsetMargin;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = -((autoHeight - maxHeight) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY , _space / 2.0, offsetY,  -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY,  -_space / 2.0, offsetY, _space / 2.0)];
                }
                    break;
            }
        }
            break;
        case MMBtnImageStyleRight:
        {
            switch (self.layoutStyle)
            {
                case MMBtnLayoutStyleNone:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = _minSize.width;
                        autoHeight = _minSize.height;
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width - _space / 2.0, 0, imageSize.width + _space / 2.0)];
                    
                    CGFloat titleLabelWidth = titleSize.width;
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth + _space / 2.0, -0, -titleLabelWidth - _space / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleLeft:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = ((autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width - offsetX, 0, imageSize.width + offsetX)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth - offsetX + _space, 0, -titleLabelWidth + offsetX - _space)];
                }
                    break;
                case MMBtnLayoutStyleRight:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = -((autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width - offsetX - _space, 0, imageSize.width + offsetX + _space)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth - offsetX, 0, -titleLabelWidth + offsetX)];
                }
                    break;
                case MMBtnLayoutStyleTop:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight + _offsetMargin;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = (autoHeight - maxHeight) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY, -imageSize.width - _space / 2.0, offsetY, imageSize.width + _space / 2.0)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY, titleLabelWidth + _space / 2.0, offsetY, -titleLabelWidth - _space / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleBottom:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight + _offsetMargin;
                        }
                    }
                    
                    CGFloat offsetY = -((autoHeight - maxHeight) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY, -imageSize.width - _space / 2.0, offsetY, imageSize.width + _space / 2.0)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY, titleLabelWidth + _space / 2.0, offsetY, - titleLabelWidth - _space / 2.0)];
                }
                    break;
            }
        }
            break;
            
        case MMBtnImageStyleTop:
        {
            switch (self.layoutStyle)
            {
                case MMBtnLayoutStyleNone:
                {
                    self.minSize = CGSizeMake(autoWidth, titleSize.height + titleSize.height + _space);
                    if (_autoSize)
                    {
                        autoWidth = maxWidth;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = titleSize.height + titleSize.height + _space;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height + _space) / 2.0, -imageSize.width / 2.0, -(imageSize.height + _space) / 2.0, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + _space) / 2.0, titleSize.width / 2.0, (titleSize.height + _space) / 2.0, -titleSize.width / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleLeft:
                {
                    if (_autoSize)
                    {
                        autoWidth = maxWidth + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = titleSize.height + titleSize.height + _space;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX =  (self.width - maxWidth) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, -(imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, (titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case MMBtnLayoutStyleRight:
                {
                    autoWidth = maxWidth + _offsetMargin;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = -((self.width - maxWidth) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, -(imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, (titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case MMBtnLayoutStyleTop:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space + _offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = ((autoHeight - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height) / 2.0 - offsetY + _space, -imageSize.width / 2.0, -(imageSize.height) / 2.0 + offsetY - _space, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-titleSize.height / 2.0 - offsetY, titleSize.width / 2.0, titleSize.height / 2.0 + offsetY, -titleSize.width / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleBottom:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space + _offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = -((self.height - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height / 2.0 - offsetY, -imageSize.width / 2.0, -imageSize.height / 2.0  + offsetY, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-titleSize.height / 2.0 - offsetY - _space, titleSize.width / 2.0, titleSize.height / 2.0 + offsetY + _space, -titleSize.width / 2.0)];
                }
                    break;
            }
        }
            break;
            
        case MMBtnImageStyleBottom:
        {
            switch (self.layoutStyle)
            {
                case MMBtnLayoutStyleNone:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height + _space) / 2.0, -imageSize.width / 2.0, (imageSize.height + _space) / 2.0, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + _space) / 2.0, titleSize.width / 2.0, -(titleSize.height + _space) / 2.0, -titleSize.width / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleLeft:
                {
                    autoWidth = maxWidth + _offsetMargin;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX =  (self.width - maxWidth) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, (imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, -(titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case MMBtnLayoutStyleRight:
                {
                    autoWidth = maxWidth + _offsetMargin;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = -((self.width - maxWidth) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, (imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, -(titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case MMBtnLayoutStyleTop:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space +_offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = ((autoHeight - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height) / 2.0 - offsetY, -imageSize.width / 2.0, (imageSize.height) / 2.0 + offsetY, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(titleSize.height / 2.0 - offsetY + _space, titleSize.width / 2.0, -titleSize.height / 2.0 + offsetY - _space, -titleSize.width / 2.0)];
                }
                    break;
                case MMBtnLayoutStyleBottom:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space +_offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = -((autoHeight - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height) / 2.0 - offsetY, -imageSize.width / 2.0, (imageSize.height) / 2.0 + offsetY, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(titleSize.height / 2.0 - offsetY + _space, titleSize.width / 2.0, -titleSize.height / 2.0 + offsetY - _space, -titleSize.width / 2.0)];
                }
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    if (_autoSize)
    {
        tempFrame.size = CGSizeMake(ceilf(autoWidth), ceilf(autoHeight));
        
        self.frame = tempFrame;
    }

}

/*
- (void)layoutBtnSubviews{
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.titleLabel getSize];
    
    //image中心移动的x距离
    CGFloat imageOffsetX = (imageSize.width + titleSize.width) / 2 - imageSize.width / 2;
    //image中心移动的y距离
    CGFloat imageOffsetY = imageSize.height / 2 + _space / 2;
    //title中心移动的x距离
    CGFloat titleOffsetX = (imageSize.width + titleSize.width / 2) - (imageSize.width + titleSize.width) / 2;
    //title中心移动的y距离
    CGFloat labelOffsetY = titleSize.height/ 2 + _space / 2;
    
    CGFloat imageTop = self.imageEdgeInsets.top;
    CGFloat imageLeft = self.imageEdgeInsets.left;
    CGFloat imageBottom = self.imageEdgeInsets.bottom;
    CGFloat imageRight = self.imageEdgeInsets.right;
    
    CGFloat titleTop = self.titleEdgeInsets.top;
    CGFloat titleLeft = self.titleEdgeInsets.left;
    CGFloat titleBottom = self.titleEdgeInsets.bottom;
    CGFloat titleRight = self.titleEdgeInsets.right;


    
//    CGFloat maxWidth = (imageSize.width > titleSize.width) ? imageSize.width : titleSize.width;
//    
//    CGFloat maxHeight = (imageSize.height > titleSize.height) ? imageSize.height : titleSize.height;
    
//    CGRect tempFrame = self.frame;
    switch (self.imageStyle) {
        case MMBtnImageStyleDefault:{
            switch (self.layoutStyle) {
                case MMBtnLayoutStyleLeft:
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _space / 2.0, 0, -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_space / 2.0, 0, _space / 2.0)];
                    break;
                case MMBtnLayoutStyleRight:
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + _space/2, 0, -(titleSize.width + _space/2));
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.height + _space/2), 0, imageSize.height + _space/2);
                    break;
                case MMBtnLayoutStyleTop:
                    self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
                    self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -titleOffsetX, -labelOffsetY, titleOffsetX);
                    
                    break;
                case MMBtnLayoutStyleBottom:
                    self.imageEdgeInsets = UIEdgeInsetsMake(imageTop + _offsetMargin, imageLeft, imageBottom - _offsetMargin, imageRight);
                    self.titleEdgeInsets = UIEdgeInsetsMake(titleTop + _offsetMargin, titleLeft, titleBottom - _offsetMargin, titleRight);
                    break;
          
            }
        }
            
            break;
        case MMBtnImageStyleRight:
            switch (self.layoutStyle) {
                case MMBtnLayoutStyleLeft:
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _space / 2.0, 0, -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_space / 2.0, 0, _space / 2.0)];
                    break;
                case MMBtnLayoutStyleRight:
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + _space/2, 0, -(titleSize.width + _space/2));
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.height + _space/2), 0, imageSize.height + _space/2);
                    break;
                case MMBtnLayoutStyleTop:
                    self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
                    self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -titleOffsetX, -labelOffsetY, titleOffsetX);
                    
                    break;
                case MMBtnLayoutStyleBottom:
                    self.imageEdgeInsets = UIEdgeInsetsMake(imageTop + _offsetMargin, imageLeft, imageBottom - _offsetMargin, imageRight);
                    self.titleEdgeInsets = UIEdgeInsetsMake(titleTop + _offsetMargin, titleLeft, titleBottom - _offsetMargin, titleRight);
                    break;
                    
            }

            
            break;
        case MMBtnImageStyleTop:
            switch (self.layoutStyle) {
                case MMBtnLayoutStyleLeft:
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _space / 2.0, 0, -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_space / 2.0, 0, _space / 2.0)];
                    break;
                case MMBtnLayoutStyleRight:
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + _space/2, 0, -(titleSize.width + _space/2));
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.height + _space/2), 0, imageSize.height + _space/2);
                    break;
                case MMBtnLayoutStyleTop:
                    self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
                    self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -titleOffsetX, -labelOffsetY, titleOffsetX);
                    
                    break;
                case MMBtnLayoutStyleBottom:
                    self.imageEdgeInsets = UIEdgeInsetsMake(imageTop + _offsetMargin, imageLeft, imageBottom - _offsetMargin, imageRight);
                    self.titleEdgeInsets = UIEdgeInsetsMake(titleTop + _offsetMargin, titleLeft, titleBottom - _offsetMargin, titleRight);
                    break;
                    
            }

            
            break;
        case MMBtnImageStyleBottom:
            switch (self.layoutStyle) {
                case MMBtnLayoutStyleLeft:
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _space / 2.0, 0, -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_space / 2.0, 0, _space / 2.0)];
                    break;
                case MMBtnLayoutStyleRight:
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + _space/2, 0, -(titleSize.width + _space/2));
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.height + _space/2), 0, imageSize.height + _space/2);
                    break;
                case MMBtnLayoutStyleTop:
                    self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
                    self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -titleOffsetX, -labelOffsetY, titleOffsetX);
                    
                    break;
                case MMBtnLayoutStyleBottom:
                    self.imageEdgeInsets = UIEdgeInsetsMake(imageTop + _offsetMargin, imageLeft, imageBottom - _offsetMargin, imageRight);
                    self.titleEdgeInsets = UIEdgeInsetsMake(titleTop + _offsetMargin, titleLeft, titleBottom - _offsetMargin, titleRight);
                    break;
                    
            }

            
            break;
            
        default:
            break;
    }
}

- (void)setImageLocation:(ZFSImageLocation)location spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGSize texth_wXQ = CGSizeMake(MAXFLOAT,MAXFLOAT);
    NSDictionary *dicText = @{NSFontAttributeName :self.titleLabel.font};
    CGFloat titleWidth = [self.titleLabel.text boundingRectWithSize:texth_wXQ options:NSStringDrawingUsesLineFragmentOrigin attributes:dicText context:nil].size.width;
    
    CGFloat titleHeight = [self.titleLabel.text boundingRectWithSize:texth_wXQ options:NSStringDrawingUsesLineFragmentOrigin attributes:dicText context:nil].size.height;
    //image中心移动的x距离
    CGFloat imageOffsetX = (imageWith + titleWidth) / 2 - imageWith / 2;
    //image中心移动的y距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;
    //title中心移动的x距离
    CGFloat titleOffsetX = (imageWith + titleWidth / 2) - (imageWith + titleWidth) / 2;
    //title中心移动的y距离
    CGFloat labelOffsetY = titleHeight / 2 + spacing / 2;
    
    switch (location) {
        case ZFSImageLocationLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case ZFSImageLocationRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + spacing/2, 0, -(titleWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case ZFSImageLocationTop:
            
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -titleOffsetX, -labelOffsetY, titleOffsetX);
            break;
            
        case ZFSImageLocationBottom:
            
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -titleOffsetX, labelOffsetY, titleOffsetX);
            
            break;
            
        default:
            break;
    }
    
}

- (void)setImageLocation:(ZFSImageLocation)location spacing:(CGFloat)spacing offSet:(ZFSOffSetDirection)offSetDirection offSetVar:(CGFloat)offSetVar{
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGSize texth_wXQ = CGSizeMake(MAXFLOAT,MAXFLOAT);
    NSDictionary *dicText = @{NSFontAttributeName :self.titleLabel.font};
    CGFloat titleWidth = [self.titleLabel.text boundingRectWithSize:texth_wXQ options:NSStringDrawingUsesLineFragmentOrigin attributes:dicText context:nil].size.width;
    
    CGFloat titleHeight = [self.titleLabel.text boundingRectWithSize:texth_wXQ options:NSStringDrawingUsesLineFragmentOrigin attributes:dicText context:nil].size.height;
    
    //image中心移动的x距离
    CGFloat imageOffsetX = (imageWith + titleWidth) / 2 - imageWith / 2;
    //image中心移动的y距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;
    //title中心移动的x距离
    CGFloat titleOffsetX = (imageWith + titleWidth / 2) - (imageWith + titleWidth) / 2;
    //title中心移动的y距离
    CGFloat labelOffsetY = titleHeight / 2 + spacing / 2;
    
    switch (location) {
        case ZFSImageLocationLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case ZFSImageLocationRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + spacing/2, 0, -(titleWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case ZFSImageLocationTop:
            
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -titleOffsetX, -labelOffsetY, titleOffsetX);
            break;
            
        case ZFSImageLocationBottom:
            
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -titleOffsetX, labelOffsetY, titleOffsetX);
            
            break;
            
        default:
            break;
    }
    
    CGFloat imageTop = self.imageEdgeInsets.top;
    CGFloat imageLeft = self.imageEdgeInsets.left;
    CGFloat imageBottom = self.imageEdgeInsets.bottom;
    CGFloat imageRight = self.imageEdgeInsets.right;
    
    CGFloat titleTop = self.titleEdgeInsets.top;
    CGFloat titleLeft = self.titleEdgeInsets.left;
    CGFloat titleBottom = self.titleEdgeInsets.bottom;
    CGFloat titleRight = self.titleEdgeInsets.right;
    switch (offSetDirection){
        case ZFSOffSetDirectionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageTop, imageLeft - offSetVar, imageBottom, imageRight + offSetVar);
            self.titleEdgeInsets = UIEdgeInsetsMake(titleTop, titleLeft - offSetVar, titleBottom, titleRight + offSetVar);
            
            break;
        case ZFSOffSetDirectionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageTop, imageLeft + offSetVar, imageBottom, imageRight - offSetVar);
            self.titleEdgeInsets = UIEdgeInsetsMake(titleTop, titleLeft + offSetVar, titleBottom, titleRight - offSetVar);
            break;
        case ZFSOffSetDirectionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageTop - offSetVar , imageLeft, imageBottom + offSetVar, imageRight);
            self.titleEdgeInsets = UIEdgeInsetsMake(titleTop - offSetVar , titleLeft, titleBottom + offSetVar, titleRight);
            break;
        case ZFSOffSetDirectionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageTop + offSetVar, imageLeft, imageBottom - offSetVar, imageRight);
            self.titleEdgeInsets = UIEdgeInsetsMake(titleTop + offSetVar, titleLeft, titleBottom - offSetVar, titleRight);
            break;
        default:
            break;
    }
    
}
 */

@end
