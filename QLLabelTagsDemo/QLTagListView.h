//
//  QLTagListView.h
//  QLLabelTagsDemo
//
//  Created by qiu on 2018/6/12.
//  Copyright © 2018年 QiuFairy. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  使用说明
 *1、使用的时候直接创建QLtagListView控件，自定义控件的origin、width、高度随传入数组变量变化自适应
 *2、设置过单一标签颜色后，多样色失效单一标签颜色优先级要高于多样色属性
 *3、支持设置上下左右的距离但是方法一定要放在-(void)setTagWithTagArray:(NSArray*)arr;之前，否则失效
 *4、支持传入默认选中的数组
 */
@interface QLTagListView : UIView{
    CGRect previousFrame ;
    int totalHeight ;
    NSMutableArray*_tagArr;
    
}
/**
 * 整个view的背景色
 */
@property(nonatomic,retain)UIColor*QLbackgroundColor;
/**
 *  设置单一颜色
 */
@property(nonatomic)UIColor*signalTagColor;

@property(nonatomic)UIColor*titleNormalColor;
@property(nonatomic)UIColor*titleSelectColor;
/**
 *  回调统计选中tag
 */
@property(nonatomic,copy)void (^didselectItemBlock)(NSArray*arr);

/**
 *  是否可点击
 */
@property(nonatomic) BOOL canTouch;
/**
 *  限制点击个数
 *  0->不限制
 *  不设置此属性默认不限制
 */
@property(nonatomic) NSInteger canTouchNum;

/** 单选模式,该属性的优先级要高于canTouchNum */

@property(nonatomic) BOOL isSingleSelect;
/**
 *  标签文本赋值
 */
-(void)setTagWithTagArray:(NSArray*)arr;
/**
 *  设置默认选中的数组  default为nil
 */
-(void)setTagWithSelectTagArr:(NSArray *)arr;
/**
 *  设置tag之间的距离
 */
-(void)setMarginBetweenTagLabel:(CGFloat)Margin AndBottomMargin:(CGFloat)BottomMargin;

-(void)clearTheAllSelectItem;

@end
