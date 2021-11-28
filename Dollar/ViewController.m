//
//  ViewController.m
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import "ViewController.h"


@interface Dollar : NSObject
-(NSArray *) getDataFrom:(NSString *)link type:(NSString *)type;
@end

@interface ViewController ()
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
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:34.0/255.0 green:211.0/255.0 blue:198.0/255.0 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:145/255.0 green:72/255.0 blue:203/255.0 alpha:1.0] CGColor], nil];
    [_BG.layer addSublayer:gradient];
    
    // DOLLAR
    /*id dollar = [[Dollar alloc] init];
    NSArray *blue = [dollar getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"blue"];
    NSArray *official = [dollar getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"official"];
    
    NSLog(@"BLUE (compra, venta): %@ %@", blue[0], blue[1]);
    NSLog(@"OFFICIAL (compra, venta): %@ %@", official[0], official[1]);*/
}

@end

@implementation Dollar

-(NSArray *) getDataFrom:(NSString *)link type:(NSString *)type {
    NSString *url = [link stringByAppendingString:type];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSError *error = nil;
    id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    } else {
        NSArray *result = @[[response objectForKey:@"compra"], [response objectForKey:@"venta"]];
        return result;
    }
    
    return 0;
}

@end
