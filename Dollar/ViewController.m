//
//  ViewController.m
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import "ViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface ViewController ()
// Buttons
- (IBAction)dataProvider:(id)sender;
- (IBAction)updateButton:(id)sender;
// Arrows
@property (weak, nonatomic) IBOutlet UIImageView *blueArrow;
@property (weak, nonatomic) IBOutlet UIImageView *officialArrow;
// Labels
@property (weak, nonatomic) IBOutlet UILabel *blueVenta;
@property (weak, nonatomic) IBOutlet UILabel *blueCompra;
@property (weak, nonatomic) IBOutlet UILabel *officialVenta;
@property (weak, nonatomic) IBOutlet UILabel *officialCompra;
@property (strong, nonatomic) IBOutlet UIView *BG;
// ...
@property unsigned char tries;
- (void)prompt:(NSString *)title message:(NSString *)message action:(NSString *)action;
- (void)update;
@end

@implementation ViewController

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

// Custom Methods

- (void)prompt:(NSString *)title message:(NSString *)msg action:(NSString *)act {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:act style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)update {
    id dollar = [[Dollar alloc] init];
    [dollar updateLabel:_officialCompra str2:_officialVenta str3:_blueCompra str4:_blueVenta];
}

- (IBAction)updateButton:(id)sender {
    AudioServicesPlaySystemSound(1519);
    if (_tries >= 5) { [self prompt:@"Oops!" message:@"You don't have any more tries." action:@"Okay"]; return; }
    [self update];
    _tries++;
}

- (IBAction)dataProvider:(id)sender {
    AudioServicesPlaySystemSound(1519);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://dolarhoy.com"] options:@{} completionHandler:nil];
}

@end
