//
//  ViewController.h
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import <UIKit/UIKit.h>

@interface Dollar : NSObject
-(NSArray *) getDataFrom:(NSString *)link type:(NSString *)type;
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

@interface ViewController : UIViewController


@end

