//
//  main.m
//  TTTSet
//
//  Created by Patrick Sanders on 27.11.15.
//  Copyright © 2015 turntotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomSet.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CustomSet *set = [[CustomSet alloc] initWithType:[NSString class]];
        [set addToSet:@"Hello"];
        
        @try {
            [set addToSet:@12];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
        
        [set addToSet:@"Hello"];
        [set objectInSet:@"Hello"];
        [set addToSet:@"Hello3"];
        [set removeFromSet:@"Hello"];
        [set objectInSet:@"Hello"];
        [set addToSet:@"Hello4"];
        [set objectsInSet];
        
        CustomSet *set2 = [[CustomSet alloc] initWithType:[NSNumber class]];
        NSNumber *num = [NSNumber numberWithInt:0];
        NSNumber *num2 = [NSNumber numberWithInt:3];
        NSNumber *num3 = [NSNumber numberWithFloat:10.0];
        [set2 addToSet:num];
        [set2 addToSet:num2];
        
        @try {
            [set2 addToSet:@"hello"];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
        
        [set2 addToSet:num3];
        [set2 objectInSet:num2];
        [set2 removeFromSet:num];
        [set2 objectsInSet];

    }
    return 0;
}
