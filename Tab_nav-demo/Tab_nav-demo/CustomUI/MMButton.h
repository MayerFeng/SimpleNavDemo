//
//  MMButton.h
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import <UIKit/UIKit.h>

//图片在文字的布局位置
typedef NS_ENUM(NSInteger, MMBtnImageStyle) {
    MMBtnImageStyleDefault = 0, //图片默认是在左边
    MMBtnImageStyleRight,
    MMBtnImageStyleTop,
    MMBtnImageStyleBottom,
    
};

//图片文字的整体偏移方向
typedef NS_ENUM(NSInteger, MMBtnLayoutStyle) {
    MMBtnLayoutStyleNone = 0,
    MMBtnLayoutStyleLeft,
    MMBtnLayoutStyleRight,
    MMBtnLayoutStyleTop,
    MMBtnLayoutStyleBottom,
};




@interface MMButton : UIButton

@property (nonatomic ,assign)MMBtnImageStyle imageStyle;
@property (nonatomic ,assign)MMBtnLayoutStyle layoutStyle;
@property (nonatomic ,assign)CGFloat space;
@property (nonatomic ,assign)CGFloat offsetMargin;
@property (nonatomic ,assign)BOOL autoSize; //自适应大小

@property (nonatomic, assign) CGSize minSize;

/**
 *  @param frame 按钮的frame
 *  @param imageStyle 图片位于文本的哪个方位
 *  @param layoutStyle 文本和图片的整体偏移方向
 *  @param font 文本字体的字号
 *  @param title button的标题
 *  @param image button的图片
 *  @param space  图片和文本的间距离
 *  @param margin 图片跟文本整体偏移的距离
 *  @param autoSize YES:按钮适应图片跟文本的大小
 */


- (instancetype)initWithFrame:(CGRect)frame
                   imageStyle:(MMBtnImageStyle)imageStyle
                  layoutStyle:(MMBtnLayoutStyle)layoutStyle
                         font:(UIFont *)font
                        title:(NSString *)title
                        image:(UIImage *)image
                        space:(CGFloat)space
                       offset:(CGFloat)margin
                     autoSize:(BOOL)autoSize;



 //参考的demo
/**
 *  根据图片的位置和图片文字的间距来重新设置button的image和title的排列
 *   如果图片和文字大于button的大小，文字和图片显示的地方就会超出按钮
 *
 *  @param location 图片位于文字的哪个方位
 *  @param spacing  图片和文字的间距离
 */
//- (void)setImageLocation:(ZFSImageLocation)location spacing:(CGFloat)spacing;

/**
 *  根据图片的位置和图片文字的间距来重新设置button的image和title的排列，根据offset来确定整体要偏移的方向以及偏移的数值
 *   如果图片和文字大于button的大小，文字和图片显示的地方就会超出按钮
 *
 *  @param location         图片在文字的哪个方向
 *  @param spacing         图片和文字的间隔
 *  @param offSetDirection 哪个方向偏移
 *  @param offSetVar       偏移多少
 */
//- (void)setImageLocation:(ZFSImageLocation)location spacing:(CGFloat)spacing offSet:(ZFSOffSetDirection)offSetDirection offSetVar:(CGFloat)offSetVar;
@end
