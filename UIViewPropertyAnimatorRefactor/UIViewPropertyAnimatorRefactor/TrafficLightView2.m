//
//  TrafficLightView.cpp
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import "TrafficLightView.h"

@interface TrafficLightView2 ()
@end

@implementation TrafficLightView2

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
    
    [UIView animateKeyframesWithDuration:42
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeDiscrete
                              animations:^{
    
        // keyframe #1
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            // TODO: keyframe #1
        }];
        
        // keyframe #2
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            // TODO: keyframe #2
        }];
        
        // keyframe #3
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            // TODO: keyframe #3
        }];
        
        // keyframe #4
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            // TODO: keyframe #4
        }];
        
    } completion:^(BOOL finished) {
        assert(finished);
    }];
}

- (void)stopAnimation
{
    
}

@end
