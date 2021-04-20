//
//  ViewController.m
//  UIViewPropertyAnimatorRefactor
//
//  Created by Olha Pavliuk on 20.04.2021.
//

#import "ViewController.h"
#import "TrafficLightView.h"

@interface ViewController ()
{
    TrafficLightView1* _tlView1;
    TrafficLightView2* _tlView2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = self.view.frame.size.width, h = self.view.frame.size.height;
    CGFloat gridY1 = 100;
    
    [self addButtons];
    
    _tlView1 = [[TrafficLightView1 alloc] initWithFrame:CGRectMake(0, gridY1, w, (h-gridY1)/2)];
    _tlView2 = [[TrafficLightView2 alloc] initWithFrame:CGRectMake(0, gridY1+(h-gridY1)/2, w, (h-gridY1)/2)];
    [self.view addSubview:_tlView1];
    [self.view addSubview:_tlView2];
}

- (void)addButtons {
    CGFloat w = self.view.frame.size.width, h = self.view.frame.size.height;
    
    CGFloat gridY1 = 50;
    
    UIButton* runBtn = [[UIButton alloc] initWithFrame:CGRectMake(w-100, gridY1, 100, 40)];
    runBtn.backgroundColor = UIColor.blueColor;
    [runBtn setTitle:@"Run!" forState:UIControlStateNormal];
    [runBtn addTarget:self action:@selector(onRunBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runBtn];
    
    UIButton* stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(w-220, gridY1, 100, 40)];
    stopBtn.backgroundColor = UIColor.darkGrayColor;
    [stopBtn setTitle:@"Stop!" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(onStopBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}

- (void)onStopBtnPressed
{
    [_tlView1 stopAnimation];
    [_tlView2 stopAnimation];
}

- (void)onRunBtnPressed
{
    [_tlView1 startAnimation];
    [_tlView2 startAnimation];
}

@end
