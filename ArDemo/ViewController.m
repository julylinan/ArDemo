//
//  ViewController.m
//  ArDemo
//
//  Created by Tony Duan on 2017/3/8.
//  Copyright © 2017年 ChengduRuiMa. All rights reserved.
//

#import "ViewController.h"
#import "LFLivePreview.h"
#import "GLModelView.h"

@interface ViewController ()

@property (strong,nonatomic) GLModelView *modelView;
@property (strong,nonatomic) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[[LFLivePreview alloc] initWithFrame:self.view.bounds]];
    self.modelView = [[GLModelView alloc]init];
    [self.view addSubview:self.modelView];
    self.modelView.frame = self.view.bounds;
    
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 60, 30)];
    //[button setTitle:@"ship" forState:normal];
    self.button.layer.borderColor = [[UIColor blackColor]CGColor];
    self.button.layer.borderWidth = 1;
    self.button.layer.cornerRadius = 15;
    [self.view addSubview:self.button];
    
    [self setModel:5];
    
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchModel:)];
    [self.view addGestureRecognizer:pinch];
    
    // pan gesture - rotate on axis
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panModel:)];
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setModel:(NSInteger)index
{
    self.modelView.backgroundColor = [UIColor clearColor];
    switch (index)
    {
        case 0:
        {
            //set title
            [self.button setTitle:@"demon.model" forState:normal];
            
            //set model
            self.modelView.texture = [GLImage imageNamed:@"demon.png"];
            self.modelView.blendColor = nil;
            self.modelView.model = [GLModel modelWithContentsOfFile:@"demon.model"];
            
            //set default transform
            CATransform3D transform = CATransform3DMakeTranslation(0.0, 0.0, -2.0);
            transform = CATransform3DScale(transform, 0.01, 0.01, 0.01);
            transform = CATransform3DRotate(transform, (CGFloat)-M_PI_2, 1.0, 0.0, 0.0);
            self.modelView.modelTransform = transform;
            
            break;
        }
        case 1:
        {
            //set title
            [self.button setTitle:@"quad" forState:normal];
            //self.navBar.topItem.title = @"quad";
            
            //set model
            self.modelView.texture = nil;
            self.modelView.blendColor = [UIColor redColor];
            self.modelView.model = [GLModel modelWithContentsOfFile:@"quad.obj"];
            
            //set default transform
            self.modelView.modelTransform = CATransform3DMakeTranslation(0.0, 0.0, -2.0);
            
            break;
        }
        case 2:
        {
            //set title
            [self.button setTitle:@"chair" forState:normal];
            //self.navBar.topItem.title = @"chair.obj";
            
            //set model
            self.modelView.texture = [GLImage imageNamed:@"chair.tga"];
            self.modelView.blendColor = nil;
            self.modelView.model = [GLModel modelWithContentsOfFile:@"chair.obj"];
            
            //set default transform
            CATransform3D transform = CATransform3DMakeTranslation(0.0, 0.0, -2.0);
            transform = CATransform3DScale(transform, 0.01, 0.01, 0.01);
            transform = CATransform3DRotate(transform, 0.2, 1.0, 0.0, 0.0);
            self.modelView.modelTransform = transform;
            
            break;
        }
        case 3:
        {
            //set title
            [self.button setTitle:@"diamond" forState:normal];
            //self.navBar.topItem.title = @"diamond.obj";
            
            //set model
            self.modelView.texture = nil;
            self.modelView.blendColor = [UIColor greenColor];
            self.modelView.model = [GLModel modelWithContentsOfFile:@"diamond.obj"];
            
            //set default transform
            CATransform3D transform = CATransform3DMakeTranslation(0.0, 0.0, -1.0);
            transform = CATransform3DScale(transform, 0.01, 0.01, 0.01);
            transform = CATransform3DRotate(transform, (CGFloat)M_PI_2, 1.0, 0.0, 0.0);
            self.modelView.modelTransform = transform;
            
            break;
        }
        case 4:
        {
            //set title
            [self.button setTitle:@"cube" forState:normal];
            //self.navBar.topItem.title = @"cube.obj";
            
            //set model
            self.modelView.texture = nil;
            self.modelView.blendColor = [UIColor whiteColor];
            self.modelView.model = [GLModel modelWithContentsOfFile:@"cube.obj"];
            
            //set default transform
            CATransform3D transform = CATransform3DMakeTranslation(0.0, 0.0, -1.0);
            transform = CATransform3DRotate(transform, (CGFloat)M_PI_4, 1.0, 1.0, 0.0);
            self.modelView.modelTransform = transform;
            
            break;
        }
        case 5:
        {
            //set title
            [self.button setTitle:@"ship" forState:normal];
            //self.navBar.topItem.title = @"ship.obj";
            
            //set model
            self.modelView.texture = nil;
            self.modelView.blendColor = [UIColor grayColor];
            self.modelView.model = [GLModel modelWithContentsOfFile:@"ship.obj"];
            
            //set default transform
            CATransform3D transform = CATransform3DMakeTranslation(0.0, 0.0, -15.0);
            transform = CATransform3DRotate(transform, (CGFloat)M_PI + 0.4, 0.0, 0.0, 1.0);
            transform = CATransform3DRotate(transform, (CGFloat)M_PI_4, 1.0, 0.0, 0.0);
            transform = CATransform3DRotate(transform, -0.4, 0.0, 1.0, 0.0);
            transform = CATransform3DScale(transform, 3.0, 3.0, 3.0);
            self.modelView.modelTransform = transform;
            
            break;
        }
    }
}

- (void)pinchModel:(UIPinchGestureRecognizer*)pinch
{
    CATransform3D transform = self.modelView.modelTransform;
    transform = CATransform3DScale(transform, pinch.scale, pinch.scale, pinch.scale);
    self.modelView.modelTransform = transform;
    pinch.scale = 1.0;
}

- (void)panModel:(UIPanGestureRecognizer*)pan
{
    UIView *view = pan.view;
    if (pan.state == UIGestureRecognizerStateBegan || pan.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [pan translationInView:view];
        NSLog(@"pan translation = (%f, %f)", translation.x, translation.y);
        CATransform3D transform = self.modelView.modelTransform;
        CGFloat factor = translation.x / 20;
        transform = CATransform3DRotate(transform, factor * 0.314, 0.0, 1.0, 0.0);
        self.modelView.modelTransform = transform;
        [pan setTranslation:CGPointZero inView:view];
    }
}

@end
