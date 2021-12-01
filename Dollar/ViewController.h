//
//  ViewController.h
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@end

@interface Dollar : NSObject
- (NSArray *) getDataFrom:(NSString *)link type:(NSString *)type;
- (void) updateLabel:(UILabel *)str1 str2:(UILabel *)str2 str3:(UILabel *) str3 str4:(UILabel *)str4;
@end

@implementation Dollar

- (NSArray *) getDataFrom:(NSString *)link type:(NSString *)type {
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

//    [dollar updateLabel:_officialVenta str2:_officialCompra str3:_blueCompra str4:_blueVenta];
- (void) updateLabel:(UILabel *)str1 str2:(UILabel *)str2 str3:(UILabel *) str3 str4:(UILabel *)str4 {
    NSArray *blue = [self getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"blue"];
    NSArray *official = [self getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"official"];
    
    str1.text = [NSString stringWithFormat:@"$%@", official[0]];
    str2.text = [NSString stringWithFormat:@"$%@", official[1]];
    str3.text = [NSString stringWithFormat:@"$%@", blue[0]];
    str4.text = [NSString stringWithFormat:@"$%@", blue[1]];
}

@end
