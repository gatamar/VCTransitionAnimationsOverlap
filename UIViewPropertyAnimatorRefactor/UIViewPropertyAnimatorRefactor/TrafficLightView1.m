//
//  TrafficLightView.cpp
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import "TrafficLightView.h"

@interface TrafficLightView1 ()
@end

@implementation TrafficLightView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}


- (void)startAnimation
{
    CGFloat w = self.frame.size.width;
    CGRect f1 = _view1.frame;
    f1.origin.x = w/2;
    CGRect f2 = _view2.frame;
    f2.origin.x = w/2;
    CGRect f3 = _view3.frame;
    f3.origin.x = w/2;
    
    [UIView animateWithDuration:tl_dur1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _view1.frame = f1;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:tl_dur2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _view2.frame = f2;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:tl_dur3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _view3.frame = f3;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:tl_dur4 delay:tl_dur2 options:UIViewAnimationOptionCurveLinear animations:^{
        _view1.frame = CGRectZero;
        _view2.frame = CGRectZero;
        _view3.frame = CGRectZero;
    } completion:^(BOOL finished) {
        [_view1 removeFromSuperview];
        [_view2 removeFromSuperview];
        [_view3 removeFromSuperview];
    }];
}

- (void)stopAnimation
{
    
}

@end
