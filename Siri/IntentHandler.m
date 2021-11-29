//
//  IntentHandler.m
//  Siri
//
//  Created by Tomi on 28/11/2021.
//

#import "IntentHandler.h"

@interface Dollar : NSObject
-(NSArray *) getDataFrom:(NSString *)link type:(NSString *)type;
@end

@interface IntentHandler ()

@end

@implementation IntentHandler

- (id)handlerForIntent:(INIntent *)intent {
    //id dollar = [[Dollar alloc] init];
    //NSArray *blue = [dollar getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"blue"];
    //NSArray *official = [dollar getDataFrom:@"https://dollar-api.herokuapp.com/" type:@"official"];

    return self;
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
