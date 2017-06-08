//
//  HGFactory.m
//  EnterpriseiPhone
//
//  Created by Mr_Egy on 2016/3/9.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "HGFactory.h"

@implementation HGFactory

#pragma mark - make View
+ (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor autoLayout:(BOOL)autoLayout
{
    return [self createViewWithBorderWidth:borderWidth cornerRadius:0 borderColor:borderColor autoLayout:autoLayout];
}

+ (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor autoLayout:(BOOL)autoLayout
{
    UIView *view = [[UIView alloc] init];
    
    if (borderColor) {
        view.layer.borderWidth = borderWidth;
        view.layer.borderColor = borderColor.CGColor;
        
        if (cornerRadius > 0)
        {
            view.layer.cornerRadius = cornerRadius;
        }
    }
    view.translatesAutoresizingMaskIntoConstraints = !autoLayout;
    
    return view;
}

#pragma mark - make Button
+ (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFontSize:(CGFloat)fontSize
                             target:(id)target action:(SEL)aSelect autoLayout:(BOOL)autoLayout
{
    return [self createButtonWithTitle:title titleColor:titleColor titleFontSize:fontSize normalImage:nil hightLigthImage:nil target:target action:aSelect autoLayout:autoLayout];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFontSize:(CGFloat)fontSize
                        normalImage:(UIImage *)normalImage hightLigthImage:(UIImage *)hightLightImage
                             target:(id)target action:(SEL)aSelect autoLayout:(BOOL)autoLayout
{
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        [button setTitleColor:[titleColor colorWithAlphaComponent:0.3] forState:UIControlStateHighlighted];
        [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    }
    
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (hightLightImage) {
        [button setImage:hightLightImage forState:UIControlStateHighlighted];
    }
    
    if (target) {
        [button addTarget:target action:aSelect forControlEvents:UIControlEventTouchUpInside];
    }
    
    [button setTranslatesAutoresizingMaskIntoConstraints:!autoLayout];
    
    return button;
}

#pragma mark - makeNavigationItem
+ (UIBarButtonItem *)createBackBarButtonItemWithTarget:(id)target action:(SEL)aSelector
{
    return [self createLeftButtonItemWithTarget:target action:aSelector image:[UIImage imageNamed:@"Navigation_back"]];
}

+ (UIBarButtonItem *)createLeftButtonItemWithTarget:(id)target action:(SEL)aSelector title:(NSString *)title
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:aSelector];
    return barButtonItem;
}

+ (UIBarButtonItem *)createLeftButtonItemWithTarget:(id)target action:(SEL)aSelector image:(UIImage *)image
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:target action:aSelector];
    return barButtonItem;
}

+ (UIBarButtonItem *)createRightButtonItemWithTarget:(id)target action:(SEL)aSelector title:(NSString *)title
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:aSelector];
    return barButtonItem;
}

+ (UIBarButtonItem *)createRightButtonItemWithTarget:(id)target action:(SEL)aSelector image:(UIImage *)image
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:target action:aSelector];
    return barButtonItem;
}

#pragma mark - make Label
+ (UILabel *)createLabelWithColor:(UIColor *)textColor fontSize:(CGFloat)fontSize autoLayout:(BOOL)autoLayout
{
    return [self createLabelWithColor:textColor fontSize:fontSize alignment:NSTextAlignmentLeft autoLayout:autoLayout];
}

+ (UILabel *)createLabelWithColor:(UIColor *)textColor fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment autoLayout:(BOOL)autoLayout
{
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    [label setTextColor:textColor];
    [label setTextAlignment:alignment];
    [label setTranslatesAutoresizingMaskIntoConstraints:!autoLayout];
    
    return label;
}

#pragma mark - make textField
+ (UITextField *)createTextFieldWithTextColor:(UIColor *)textColor textFontSize:(CGFloat)fontSize placeHodler:(NSString *)placeHodler autoLayout:(BOOL)autoLayout
{
    return [self createTextFieldWithLeftPadding:0 rightPadding:0 textColor:textColor textFontSize:fontSize placeHodler:placeHodler returnKeyType:UIReturnKeyDone autoLayout:autoLayout];
}


+ (UITextField *)createTextFieldWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding
                                      textColor:(UIColor *)textColor textFontSize:(CGFloat)fontSize
                                    placeHodler:(NSString *)placeHodler returnKeyType:(UIReturnKeyType)returnKeyType autoLayout:(BOOL)autoLayout
{
    UITextField *textField = [[UITextField alloc] init];
    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setTextColor:textColor];
    [textField setPlaceholder:placeHodler];
    [textField setReturnKeyType:returnKeyType];
    [textField setTranslatesAutoresizingMaskIntoConstraints:!autoLayout];
    
    return textField;
}

#pragma mark - make textView
+ (UITextView *)createTextViewWithTextColor:(UIColor *)textColor textFontSize:(CGFloat)fontSize autoLayout:(BOOL)autoLayout
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setFont:[UIFont systemFontOfSize:fontSize]];
    [textView setTextColor:textColor];
    [textView setTranslatesAutoresizingMaskIntoConstraints:!autoLayout];
    
    return textView;
}

#pragma mark - make imageView
+ (UIImageView *)createImageViewWithImage:(UIImage *)image autoLayout:(BOOL)autoLayout
{
    return [self createImageViewWithImage:image hightLightedImage:nil autoLayout:autoLayout];
}

+ (UIImageView *)createImageViewWithImage:(UIImage *)n_image hightLightedImage:(UIImage *)h_image autoLayout:(BOOL)autoLayout
{
    UIImageView *imageView  = [[UIImageView alloc] initWithImage:n_image];
    if (h_image) imageView.highlightedImage = h_image;
    imageView.translatesAutoresizingMaskIntoConstraints = !autoLayout;
    
    return imageView;
}

#pragma mark - attributionString
+ (NSAttributedString *)createAttributedWithText:(NSString *)text alignment:(NSTextAlignment)alignment lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    
    if (lineSpacing > 0)
    {
        paragraphStyle.lineSpacing = lineSpacing;
    }
    
    if (paragraphSpacing > 0)
    {
        paragraphStyle.paragraphSpacing = paragraphSpacing;
    }
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName : paragraphStyle}];
    
    return attributedString;
}


@end
