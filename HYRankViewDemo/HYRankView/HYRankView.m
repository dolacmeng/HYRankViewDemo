//
//  HYRankView.m
//  KoaliDiary
//
//  Created by JackXu on 2020/1/27.
//  Copyright © 2020 JXRice. All rights reserved.
//

#import "HYRankView.h"

@interface HYRankView()

@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;

@end

@implementation HYRankView

+(instancetype)viewWithTitle:(NSString*)title frame:(CGRect)frame{
    HYRankView *view = [[HYRankView alloc] init];
    view.title = title;
    view.frame = frame;
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (_title.length > 0) {
        CGSize textSize = [_title boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.textFont} context:nil].size;
        CGFloat textW = textSize.width;
        CGFloat textH = textSize.height;
        CGFloat triangleW = self.triangleW>0?self.triangleW:10;
        CGFloat trianglePadding = 4;
        
        UIColor *textColor = self.type==HYRankTypeNone?self.unselectColor:self.selectColor;
        [_title drawInRect:CGRectMake((self.width-textW-triangleW)/2.0, (self.height-textH)/2.0, textW, self.height) withAttributes:@{NSFontAttributeName:self.textFont,NSForegroundColorAttributeName:textColor}];

       

        //绘制上三角形
        if (self.type == HYRankTypeNone || self.type == HYRankTypeDown) {
            CGContextSetFillColorWithColor(context, self.unselectColor.CGColor);
        }else{
            CGContextSetFillColorWithColor(context, self.selectColor.CGColor);
        }

        CGFloat x1 = (self.width+textW)/2.0+trianglePadding;
        CGFloat y1 = self.height/2.0 - triangleW/2.0 - 1;
        CGContextMoveToPoint(context, x1, y1);

        CGFloat x2 = x1+triangleW/2.0;
        CGFloat y2 = y1+triangleW/2.0;
        CGContextAddLineToPoint(context, x2, y2);

        CGFloat x3 = x1-triangleW/2.0;
        CGFloat y3 = y2;
        CGContextAddLineToPoint(context, x3, y3);

        CGContextClosePath(context);
        CGContextFillPath(context);

        //绘制下三角形
        if (self.type == HYRankTypeNone || self.type == HYRankTypeUp) {
            CGContextSetFillColorWithColor(context, self.unselectColor.CGColor);
        }else{
            CGContextSetFillColorWithColor(context, self.selectColor.CGColor);
        }

        CGFloat a1 = x1;
        CGFloat b1 = y1 + triangleW + 2;
        CGContextMoveToPoint(context, a1, b1);

        CGFloat a2 = x2;
        CGFloat b2 = y2 + 2;
        CGContextAddLineToPoint(context, a2, b2);

        CGFloat a3 = x3;
        CGFloat b3 = y3 + 2;
        CGContextAddLineToPoint(context, a3, b3);

        CGContextClosePath(context);
        CGContextFillPath(context);


    }

}

-(void)makeOpposite{
    if(self.type == HYRankTypeDown){
        self.type = HYRankTypeUp;
    }else{
        self.type = HYRankTypeDown;
    }
}

-(void)setTriangleW:(CGFloat)triangleW{
    _triangleW = triangleW;
    [self setNeedsDisplay];
}

-(void)setType:(HYRankType)type{
    _type = type;
    [self setNeedsDisplay];
}

-(UIColor*)selectColor{
    return _selectColor?:[UIColor colorWithRed:137/255.0 green:67/255.0 blue:167/255.0 alpha:1.0];
}

-(UIColor*)unselectColor{
    return _unselectColor?:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102 /255.0 alpha:1.0];
}

-(UIFont*)textFont{
   return _textFont?:[UIFont systemFontOfSize:14];
}

-(CGFloat)width{
    return self.bounds.size.width;
}

-(CGFloat)height{
    return self.bounds.size.height;
}


@end
