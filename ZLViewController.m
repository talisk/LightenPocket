//
//  ViewController.m
//  ZLSwipeableViewDemo
//
//  Created by Zhixuan Lai on 11/1/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

#import "ZLViewController.h"
#import "ZLSwipeableView.h"
#import "UIColor+FlatColors.h"
#import "CardView.h"

@interface ZLViewController () <ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>
//@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeableView;

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger colorIndex;
@end

@implementation ZLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.colorIndex = 0;
    self.colors = @[
                    @"Turquoise",
                    @"Green Sea",
                    @"Emerald",
                    @"Nephritis",
                    @"Peter River",
                    @"Belize Hole",
                    @"Amethyst",
                    @"Wisteria",
                    @"Wet Asphalt",
                    @"Midnight Blue",
                    @"Sun Flower",
                    @"Orange",
                    @"Carrot",
                    @"Pumpkin",
                    @"Alizarin",
                    @"Pomegranate",
                    @"Clouds",
                    @"Silver",
                    @"Concrete",
                    @"Asbestos",
                    ];

    CGRect appframe= [[UIScreen mainScreen] applicationFrame];
    //    NSLog(@"mainScreen bounds: %.0f, %.0f, %3.0f, %3.0f",
    //          bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    //    NSLog(@"mainScreen applicationFrame: %.0f, %.0f, %3.0f, %3.0f",
    //          appframe.origin.x, appframe.origin.y, appframe.size.width, appframe.size.height);

//    ZLSwipeableView *swipeableView = [[ZLSwipeableView alloc] initWithFrame:self.view.frame];
//    ZLSwipeableView *swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    ZLSwipeableView *swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectMake(appframe.origin.x+30, appframe.origin.y+30, appframe.size.width-60, appframe.size.height-60)];
    
    
    [self.view addSubview:swipeableView];
    
    [swipeableView setNeedsLayout];
    [swipeableView layoutIfNeeded];
    
    // required data source
    swipeableView.dataSource = self;
    
    // optional delegate
    swipeableView.delegate = self;
}
//- (IBAction)swipeLeftButtonAction:(UIButton *)sender {
//    [self.swipeableView swipeTopViewToLeft];
//}
//- (IBAction)swipeRightButtonAction:(UIButton *)sender {
//    [self.swipeableView swipeTopViewToRight];
//}
//- (IBAction)reloadButtonAction:(UIButton *)sender {
//    self.colorIndex = 0;
//    [self.swipeableView discardAllSwipeableViews];
//    [self.swipeableView loadNextSwipeableViewsIfNeeded];
//}

#pragma mark - ZLSwipeableViewDelegate
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeLeft:(UIView *)view {
    NSLog(@"did swipe left");
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView didSwipeRight:(UIView *)view {
    NSLog(@"did swipe right");
}
- (void)swipeableView: (ZLSwipeableView *)swipeableView swipingView:(UIView *)view atLocation:(CGPoint)location {
    NSLog(@"swiping at location: x %f, y%f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.colorIndex<self.colors.count) {
        CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
        view.cardColor = [self colorForName:self.colors[self.colorIndex]];
        self.colorIndex++;
        return view;
    }
    return nil;
}

#pragma mark - ()
- (UIColor *)colorForName:(NSString *)name
{
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}

@end
