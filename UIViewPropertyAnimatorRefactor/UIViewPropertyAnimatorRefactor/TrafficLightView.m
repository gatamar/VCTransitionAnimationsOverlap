//
//  TrafficLightView.cpp
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import "TrafficLightView.h"

@interface TrafficLightView ()
@end

@implementation TrafficLightView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    CGFloat w = self.frame.size.width, h = self.frame.size.height;
    
    CGFloat gridY1 = 0;
    CGFloat gridStepY = (h-gridY1)/5;
    CGFloat vSide = gridStepY * 0.4;
    
    _view1 = [self createBlockViewWithColor:UIColor.greenColor
                                   andFrame:CGRectMake(0, gridY1+gridStepY-vSide, vSide, vSide)];
    _view2 = [self createBlockViewWithColor:UIColor.orangeColor
                                   andFrame:CGRectMake(0, gridY1+gridStepY*2-vSide, vSide, vSide)];
    _view3 = [self createBlockViewWithColor:UIColor.redColor
                                   andFrame:CGRectMake(0, gridY1+gridStepY*3-vSide, vSide, vSide)];
    
    [self addSubview:_view1];
    [self addSubview:_view2];
    [self addSubview:_view3];
    
    return self;
}

- (UIView*)createBlockViewWithColor:(UIColor*)color andFrame:(CGRect)frame
{
    UIView* v = [[UIView alloc] initWithFrame:frame];
    [v setUserInteractionEnabled:NO];
    v.backgroundColor = color;
    return v;
}

- (void)startAnimation
{
    abort(); // you must override
}

- (void)stopAnimation
{
    abort(); // you must override
}

@end
