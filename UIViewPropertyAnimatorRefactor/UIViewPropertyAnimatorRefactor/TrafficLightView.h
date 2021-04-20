//
//  TrafficLightView.hpp
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import <UIKit/UIKit.h>

// hardcoded durations for N-step animation, used in "TrafficLightView1" and "TrafficLightView2"
static const double tl_dur1 = 4;
static const double tl_dur2 = 5;
static const double tl_dur3 = 3;
static const double tl_dur4 = 0.1;

@interface TrafficLightView: UIView
{
    UIView* _view1;
    UIView* _view2;
    UIView* _view3;
}
// creates G, Y, R traffic lights view at specified positions
- (id)initWithFrame:(CGRect)frame;

// starts N-steps animation
- (void)startAnimation;

// stops animation at it's current state ( if knows how to stop :D )
- (void)stopAnimation;

@end

// uses old API, so can't stop animation
@interface TrafficLightView1: TrafficLightView
@end

// uses new API, so can stop/resume/change animation
@interface TrafficLightView2: TrafficLightView
@end
