//
//  ViewController.m
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView* _view1;
    UIView* _view2;
    UIView* _view3;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = self.view.frame.size.width, h = self.view.frame.size.height;
    
    CGFloat gridY1 = 50;
    CGFloat gridStepY = (h-gridY1)/5;
    CGFloat vSide = gridStepY * 0.4;
    
    UIButton* runBtn = [[UIButton alloc] initWithFrame:CGRectMake(w-100, gridY1, 100, 40)];
    runBtn.backgroundColor = UIColor.blueColor;
    [runBtn setTitle:@"Run!" forState:UIControlStateNormal];
    [runBtn addTarget:self action:@selector(onRunBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runBtn];
    
    _view1 = [self createBlockViewWithColor:UIColor.greenColor
                                   andFrame:CGRectMake(0, gridY1+gridStepY-vSide, vSide, vSide)];
    _view2 = [self createBlockViewWithColor:UIColor.orangeColor
                                   andFrame:CGRectMake(0, gridY1+gridStepY*2-vSide, vSide, vSide)];
    _view3 = [self createBlockViewWithColor:UIColor.redColor
                                   andFrame:CGRectMake(0, gridY1+gridStepY*3-vSide, vSide, vSide)];
    
    [self.view addSubview:_view1];
    [self.view addSubview:_view2];
    [self.view addSubview:_view3];
}

- (void)onRunBtnPressed
{
    CGFloat w = self.view.frame.size.width;
    CGRect f1 = _view1.frame;
    f1.origin.x = w/2;
    CGRect f2 = _view2.frame;
    f2.origin.x = w/2;
    CGRect f3 = _view3.frame;
    f3.origin.x = w/2;
    
    [UIView animateWithDuration:4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _view1.frame = f1;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _view2.frame = f2;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _view3.frame = f3;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:10 delay:6 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _view1.alpha = 0;
        _view2.alpha = 0;
        _view3.alpha = 0;
    } completion:^(BOOL finished) {
        [_view1 removeFromSuperview];
        [_view2 removeFromSuperview];
        [_view3 removeFromSuperview];
    }];
    

}

- (UIView*)createBlockViewWithColor:(UIColor*)color andFrame:(CGRect)frame
{
    UIView* v = [[UIView alloc] initWithFrame:frame];
    [v setUserInteractionEnabled:NO];
    v.backgroundColor = color;
    return v;
}


@end
