//
//  QLTagListView.m
//  QLLabelTagsDemo
//
//  Created by qiu on 2018/6/12.
//  Copyright © 2018年 QiuFairy. All rights reserved.
//

#import "QLTagListView.h"
#import "TagsFrame.h"
#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING   3.0f
#define LABEL_MARGIN       10.0f
#define BOTTOM_MARGIN      10.0f
#define KBtnTag            1000
#define R_G_B_16(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]
@interface QLTagListView(){
    
    CGFloat _KTagMargin;//左右tag之间的间距
    CGFloat _KBottomMargin;//上下tag之间的间距
    NSInteger _kSelectNum;//实际选中的标签数
    UIButton*_tempBtn;//临时保存对象
    
}
@end
@implementation QLTagListView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        _kSelectNum=0;
        totalHeight=0;
        self.frame=frame;
        _tagArr=[[NSMutableArray alloc]init];
        /**默认是多选模式 */
        self.isSingleSelect=NO;
        
    }
    return self;
    
}

#if 0
-(void)setTagWithTagArray:(NSArray*)arr{
    
    previousFrame = CGRectZero;
    [_tagArr addObjectsFromArray:arr];
    [arr enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
        
        UIButton*tagBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        tagBtn.frame=CGRectZero;
        
        if(_signalTagColor){
            //可以单一设置tag的颜色
            tagBtn.backgroundColor=_signalTagColor;
        }else{
            //tag颜色多样
            tagBtn.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
        }
        if(_canTouch){
            tagBtn.userInteractionEnabled=YES;
            
        }else{
            
            tagBtn.userInteractionEnabled=NO;
        }
        [tagBtn setTitleColor:R_G_B_16(0x818181) forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        tagBtn.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [tagBtn setTitle:str forState:UIControlStateNormal];
        tagBtn.tag=KBtnTag+idx;
        tagBtn.layer.cornerRadius=5;
        tagBtn.layer.borderColor=R_G_B_16(0xeaeaea).CGColor;
        tagBtn.layer.borderWidth=0.3;
        tagBtn.clipsToBounds=YES;
        NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
        CGSize Size_str=[str sizeWithAttributes:attrs];
        Size_str.width += HORIZONTAL_PADDING*3;
        Size_str.height += VERTICAL_PADDING*3;
        CGRect newRect = CGRectZero;
        
        if(_KTagMargin&&_KBottomMargin){
            
            if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + _KTagMargin > self.bounds.size.width) {
                
                newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + _KBottomMargin);
                totalHeight +=Size_str.height + _KBottomMargin;
            }
            else {
                newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + _KTagMargin, previousFrame.origin.y);
            }
            [self setHight:self andHight:totalHeight+Size_str.height + _KBottomMargin];
        }else{
            if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + LABEL_MARGIN > self.bounds.size.width) {
                
                newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + BOTTOM_MARGIN);
                totalHeight +=Size_str.height + BOTTOM_MARGIN;
            }
            else {
                newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
            }
            [self setHight:self andHight:totalHeight+Size_str.height + BOTTOM_MARGIN];
        }
        newRect.size = Size_str;
        [tagBtn setFrame:newRect];
        previousFrame=tagBtn.frame;
        [self setHight:self andHight:totalHeight+Size_str.height + BOTTOM_MARGIN];
        [self addSubview:tagBtn];
    }];
    if(_GBbackgroundColor){
        self.backgroundColor=_GBbackgroundColor;
    }else{
        self.backgroundColor=[UIColor whiteColor];
    }
}
#else
-(void)setTagWithTagArray:(NSArray*)arr{
    TagsFrame *tagsframe = [[TagsFrame alloc] init];
    tagsframe.defaultWidth = self.frame.size.width;
    if (_KTagMargin && _KBottomMargin) {
        tagsframe.tagsMargin = _KTagMargin;
        tagsframe.tagsLineSpacing = _KBottomMargin;
    }
    tagsframe.tagsArray = arr;
    
    [_tagArr addObjectsFromArray:arr];
    [arr enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
        
        UIButton*tagBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        tagBtn.frame=CGRectZero;
        
        if(_signalTagColor){
            //可以单一设置tag的颜色
            tagBtn.backgroundColor=_signalTagColor;
        }else{
            //tag颜色多样
            tagBtn.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
        }
        if(_canTouch){
            tagBtn.userInteractionEnabled=YES;
        }else{
            tagBtn.userInteractionEnabled=NO;
        }
        if (_titleNormalColor) {
            [tagBtn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        }else{
            [tagBtn setTitleColor:R_G_B_16(0x818181) forState:UIControlStateNormal];
        }
        
        if (_titleSelectColor) {
            [tagBtn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        }else{
            [tagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        }
        
        tagBtn.titleLabel.font=[UIFont systemFontOfSize:16.0];
        [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [tagBtn setTitle:str forState:UIControlStateNormal];
        tagBtn.tag=KBtnTag+idx;
        tagBtn.layer.borderColor=R_G_B_16(0x999999).CGColor;
        tagBtn.layer.borderWidth= 0.6;
        tagBtn.clipsToBounds=YES;
        
        tagBtn.frame = CGRectFromString(tagsframe.tagsFrames[idx]);
        tagBtn.layer.cornerRadius= tagBtn.frame.size.height/2;
        [self addSubview:tagBtn];
    }];
    [self setHight:self andHight:tagsframe.tagsHeight];
    if(_QLbackgroundColor){
        self.backgroundColor=_QLbackgroundColor;
    }else{
        self.backgroundColor=[UIColor whiteColor];
    }
}
#endif
#pragma mark - 设置默认选中的数据
-(void)setTagWithSelectTagArr:(NSArray *)arr{
    if (self.canTouchNum == 0) {
        for(UIView*view in self.subviews){
            UIButton*tempBtn=(UIButton*)view;
            if ([arr containsObject:@(tempBtn.tag-KBtnTag)]) {
                tempBtn.selected=YES;
                tempBtn.layer.borderColor=R_G_B_16(0xf59e01).CGColor;
            }else{
                tempBtn.selected=NO;
                tempBtn.layer.borderColor=R_G_B_16(0x999999).CGColor;
            }
        }
    }else{
        if(arr.count <= self.canTouchNum){
            for(UIView*view in self.subviews){
                UIButton*tempBtn=(UIButton*)view;
                if ([arr containsObject:[NSString stringWithFormat:@"%ld",(tempBtn.tag-KBtnTag)]]) {
                    tempBtn.selected=YES;
                    tempBtn.layer.borderColor=R_G_B_16(0xf59e01).CGColor;
                }else{
                    tempBtn.selected=NO;
                    tempBtn.layer.borderColor=R_G_B_16(0x999999).CGColor;
                }
            }
        }else{
            //数据正确的情况下 不会出现此中情况
            NSMutableArray *arrf = [NSMutableArray arrayWithCapacity:10];
            for (int f =0; f<self.canTouchNum; f++) {
                [arrf addObject:arr[f]];
            }
            for(UIView*view in self.subviews){
                UIButton*tempBtn=(UIButton*)view;
                if ([arrf containsObject:[NSString stringWithFormat:@"%ld",(tempBtn.tag-KBtnTag)]]) {
                    tempBtn.selected=YES;
                    tempBtn.layer.borderColor=R_G_B_16(0xf59e01).CGColor;
                }else{
                    tempBtn.selected=NO;
                    tempBtn.layer.borderColor=R_G_B_16(0x999999).CGColor;
                }
            }
        }
    }
}
#pragma mark-改变控件高度
- (void)setHight:(UIView *)view andHight:(CGFloat)hight
{
    CGRect tempFrame = view.frame;
    tempFrame.size.height = hight;
    view.frame = tempFrame;
}
-(void)tagBtnClick:(UIButton*)button{
    if(_isSingleSelect){
        if(button.selected){
            
            button.selected=!button.selected;
            
        }else{
            
            _tempBtn.selected=NO;
            _tempBtn.layer.borderColor=R_G_B_16(0x999999).CGColor;
            button.selected=YES;
            _tempBtn=button;
            _tempBtn.layer.borderColor=R_G_B_16(0xf59e01).CGColor;
        }
        
    }else{
        
        button.selected=!button.selected;
    }
    
    if(button.selected==YES){
        button.layer.borderColor=R_G_B_16(0xf59e01).CGColor;
    }else if (button.selected==NO){
        button.layer.borderColor=R_G_B_16(0x999999).CGColor;
    }
    
    [self didSelectItems];
    
    
}
-(void)didSelectItems{
    
    NSMutableArray*arr=[[NSMutableArray alloc]init];
    
    for(UIView*view in self.subviews){
        
        if([view isKindOfClass:[UIButton class]]){
            
            UIButton*tempBtn=(UIButton*)view;
            tempBtn.enabled=YES;
            if (tempBtn.selected==YES) {
                //                [arr addObject:_tagArr[tempBtn.tag-KBtnTag]];
                [arr addObject:@(tempBtn.tag-KBtnTag)];
                _kSelectNum=arr.count;
            }
        }
    }
    if(_kSelectNum==self.canTouchNum && self.canTouchNum != 0){
        
        for(UIView*view in self.subviews){
            
            UIButton*tempBtn=(UIButton*)view;
            
            if (tempBtn.selected==YES) {
                tempBtn.enabled=YES;
                
            }else{
                tempBtn.enabled=NO;
                
            }
        }
    }
    self.didselectItemBlock(arr);
    
    
}
-(void)clearTheAllSelectItem{
    for(UIView*view in self.subviews){
        UIButton*tempBtn=(UIButton*)view;
        tempBtn.selected = NO;
        tempBtn.layer.borderColor=R_G_B_16(0x999999).CGColor;
    }
}
-(void)setMarginBetweenTagLabel:(CGFloat)Margin AndBottomMargin:(CGFloat)BottomMargin{
    
    _KTagMargin=Margin;
    _KBottomMargin=BottomMargin;
    
}

@end
