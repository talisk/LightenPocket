//
//  JDMenuViewController.m
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import "UIViewController+JDSideMenu.h"
#import "ZLViewController.h"

#import "JDSideMenu.h"
#import "JDMenuViewController.h"

@interface JDMenuViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)switchController:(id)sender;
@end

@implementation JDMenuViewController

- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = CGRectInset(self.scrollView.bounds, 0, -1).size;
    self.scrollView.backgroundColor = [UIColor orangeColor];
}

+(CGColorRef) getColorFromRed:(int)red Green:(int)green Blue:(int)blue Alpha:(int)alpha
{
    CGFloat r = (CGFloat) red/255.0;
    CGFloat g = (CGFloat) green/255.0;
    CGFloat b = (CGFloat) blue/255.0;
    CGFloat a = (CGFloat) alpha/255.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef color = (CGColorRef)CGColorCreate(colorSpace, components);
    CGColorSpaceRelease(colorSpace);
    
    return color;
}


- (IBAction)switchController:(id)sender;
{
//    CGFloat randomHue = (arc4random()%256/256.0);
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view.backgroundColor = [UIColor colorWithHue:randomHue saturation:1.0 brightness:1.0 alpha:1.0];
//    viewController.title = [NSString stringWithFormat: @"Hue: %.2f", randomHue];
    UIButton *senderButton = (UIButton *)sender;
    
    // Get the senderButton's name
    NSLog(@"%@",senderButton.currentTitle);
    ZLViewController *contentController = [[ZLViewController alloc] init];
    contentController.view.backgroundColor = [UIColor blueColor];
    
    //              set the contentView's shadow            //
    // ---------------------------------------------------- //
    CGSize shadowOffset = CGSizeMake(3.1/2.0, -0.1/2.0);
    CGFloat shadowBlurRadius = 12/2.0;
    //    self.contentController.view.layer.shadowColor = [shadow CGColor];
    contentController.view.layer.shadowOpacity = 0.73;
    contentController.view.layer.shadowOffset = shadowOffset;
    contentController.view.layer.shadowRadius = shadowBlurRadius;
    contentController.view.layer.shadowColor = [JDMenuViewController getColorFromRed:0 Green:0 Blue:0 Alpha:255];
    contentController.view.layer.shadowRadius = (CGFloat)12.0;
    // ---------------------------------------------------- //
    
    
    
//    UIViewController *contentController = [[UINavigationController alloc]
//                                           initWithRootViewController:viewController];
//    [self.sideMenuController setContentController:contentController animted:YES];
    [self.sideMenuController setContentController:contentController animted:YES];
}

@end
