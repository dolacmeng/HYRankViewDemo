//
//  HYRankView.h
//  KoaliDiary
//
//  Created by JackXu on 2020/1/27.
//  Copyright © 2020 JXRice. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,HYRankType){
    HYRankTypeNone,
    HYRankTypeUp,
    HYRankTypeDown
};

@interface HYRankView : UIControl

/// 标题
@property(nonatomic,strong) NSString *title;

/// 选中状态
@property(nonatomic,assign) HYRankType type;

/// 三角形宽度
@property(nonatomic,strong) UIFont *textFont;

/// 三角形宽度
@property(nonatomic,assign) CGFloat triangleW;

/// 选中颜色（默认紫色）
@property(nonatomic,strong) UIColor *selectColor;

/// 非选中颜色（默认灰色）
@property(nonatomic,strong) UIColor *unselectColor;

/// 取相反值
-(void)makeOpposite;

+(instancetype)viewWithTitle:(NSString*)title frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
