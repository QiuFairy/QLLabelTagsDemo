//
//  TagsFrame.h
//  QLLabelTagsDemo
//
//  Created by qiu on 2018/4/11.
//  Copyright © 2018年 QiuFairy. All rights reserved.
//

//标签frame封装

#import <UIKit/UIKit.h>

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

//必须与外部保持一致，也可以单列属性
#define TagsTitleFont [UIFont systemFontOfSize:16]

@interface TagsFrame : NSObject
/** 传来的宽度 默认：WIDTH */
@property (nonatomic, assign) CGFloat defaultWidth;
/** 标签名字数组 */
@property (nonatomic, strong) NSArray *tagsArray;
/** 标签frame数组 */
@property (nonatomic, strong) NSMutableArray *tagsFrames;
/** 全部标签的高度 */
@property (nonatomic, assign) CGFloat tagsHeight;
/** 标签间距 default is 10*/
@property (nonatomic, assign) CGFloat tagsMargin;
/** 标签行间距 default is 10*/
@property (nonatomic, assign) CGFloat tagsLineSpacing;
/** 标签最小内边距 default is 10*/
@property (nonatomic, assign) CGFloat tagsMinPadding;

@end
