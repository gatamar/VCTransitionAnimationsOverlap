//
//  TrafficLightView.cpp
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import "TrafficLightView.h"
#include <cmath>

#pragma clang diagnostic ignored "-Wimplicit-retain-self"

@interface TrafficLightView2 ()
{
    UIViewPropertyAnimator* _animator;
}
@end

@implementation TrafficLightView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (void)startAnimation
{
    if (_animator) return;
    
    double step_max = std::fmax(tl_dur1, std::fmax(tl_dur2, tl_dur3));
    double dur_total = step_max + tl_dur4;
    
    _animator = [[UIViewPropertyAnimator alloc] initWithDuration:dur_total curve:UIViewAnimationCurveEaseOut animations:^{
        
        CGFloat w = self.frame.size.width;
        CGRect f1 = _view1.frame;
        f1.origin.x = w/2;
        CGRect f2 = _view2.frame;
        f2.origin.x = w/2;
        CGRect f3 = _view3.frame;
        f3.origin.x = w/2;
        
        [UIView animateKeyframesWithDuration:dur_total
                                       delay:0
                                     options:UIViewAnimationOptionCurveEaseOut
                                  animations:^{
        
            // keyframe #1
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:tl_dur1/dur_total
                                          animations:^{
                _view1.frame = f1;
            }];
            
            // keyframe #2
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:tl_dur2/dur_total
                                          animations:^{
                _view2.frame = f2;
            }];
            
            // keyframe #3
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:tl_dur3/dur_total
                                          animations:^{
                _view3.frame = f3;
            }];
            
            // keyframe #4
            [UIView addKeyframeWithRelativeStartTime:step_max/dur_total
                                    relativeDuration:tl_dur4/dur_total
                                          animations:^{
                _view1.frame = CGRectZero;
                _view2.frame = CGRectZero;
                _view3.frame = CGRectZero;
            }];
            
        } completion:^(BOOL finished) {
            if(finished)
            {
                [_view1 removeFromSuperview];
                [_view2 removeFromSuperview];
                [_view3 removeFromSuperview];
            }
        }];
    }];
    
    [_animator startAnimation];
}

- (void)stopAnimation
{
    BOOL withoutFinishing = YES;
    [_animator pauseAnimation];
    [_animator setReversed:YES];
    [_animator startAnimation];
}

@end
