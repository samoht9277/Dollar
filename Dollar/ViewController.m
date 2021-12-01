//
//  ViewController.m
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import "ViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface ViewController ()
- (IBAction)dataProvider:(id)sender;
- (IBAction)updateButton:(id)sender;
- (void)update;
@property uint8_t tries;
@property (weak, nonatomic) IBOutlet UILabel *blueVenta;
@property (weak, nonatomic) IBOutlet UILabel *blueCompra;
@property (weak, nonatomic) IBOutlet UILabel *officialVenta;
@property (weak, nonatomic) IBOutlet UILabel *officialCompra;
@property (strong, nonatomic) IBOutlet UIView *BG;
@end

@implementation ViewController

- (void)update {
    id dollar = [[Dollar alloc] init];
    [dollar updateLabel:_officialCompra str2:_officialVenta str3:_blueCompra str4:_blueVenta];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GRADIENT
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _BG.bounds;
    gradient.startPoint = CGPointZero;
    gradient.endPoint = CGPointMake(1, 1);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:225.0/255.0 green:108.0/255.0 blue:171.0/255.0 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:115/255.0 green:102/255.0 blue:255/255.0 alpha:1.0] CGColor], nil];
    [_BG.layer insertSublayer:gradient atIndex:0];
      
    _tries = 0;
    
    // DOLLAR
    [self update];
}

- (IBAction)updateButton:(id)sender {
    AudioServicesPlaySystemSound(1519);
    if (_tries == 5) return; 
    [self update];
    _tries++;
}

- (IBAction)dataProvider:(id)sender {
    AudioServicesPlaySystemSound(1519);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://dolarhoy.com"] options:@{} completionHandler:nil];
}

@end
