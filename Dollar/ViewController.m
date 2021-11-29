//
//  ViewController.m
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *blueVenta;
@property (weak, nonatomic) IBOutlet UILabel *blueCompra;
@property (weak, nonatomic) IBOutlet UILabel *officialVenta;
@property (weak, nonatomic) IBOutlet UILabel *officialCompra;
@property (strong, nonatomic) IBOutlet UIView *BG;
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
    
    // DOLLAR
    id dollar = [[Dollar alloc] init];
    NSArray *blue = [dollar getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"blue"];
    NSArray *official = [dollar getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"official"];
    
    _officialVenta.text = [NSString stringWithFormat:@"$%@", official[0]];
    _officialCompra.text = [NSString stringWithFormat:@"$%@", official[1]];
    _blueCompra.text = [NSString stringWithFormat:@"$%@.00", blue[0]];
    _blueVenta.text = [NSString stringWithFormat:@"$%@.00", blue[1]];
    
    //NSLog(@"BLUE (compra, venta): %@ %@", blue[0], blue[1]);
    //NSLog(@"OFFICIAL (compra, venta): %@ %@", official[0], official[1]);
}

@end


