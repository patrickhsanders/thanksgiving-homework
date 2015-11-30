//
//  CustomSet.m
//  TTTSet
//
//  Created by Patrick Sanders on 27.11.15.
//  Copyright © 2015 turntotech. All rights reserved.
//

#import "CustomSet.h"

@implementation CustomSet{
    NSMutableArray *set;
    Class classType;
}

// = [[NSMutableArray alloc] init]
- (instancetype)initWithType:(Class)setType{
    self = [super init];
    classType = setType;
    set = [[NSMutableArray alloc] init];
    return self;
}
- (void)addToSet:(id)objectToAdd{
    if([objectToAdd isKindOfClass:classType]){
        BOOL canBeAdded = true;
        for(id object in set){
            if([objectToAdd isEqualTo:object]){
                canBeAdded = false;
                NSLog(@"Can't add duplicate");
            }
        }
        if(canBeAdded) {
            [set addObject:objectToAdd];
        }
        NSLog(@"%@",set);
    } else {
        //Throw exception
        //@throw[NSException raise:@"somethign" format:@"some"];
        NSLog(@"Set doesn't accept type %@",[objectToAdd class]);
        NSException* myException = [NSException
                                    exceptionWithName:@"Incompatible type."
                                    reason:[NSString stringWithFormat:@"Type '%@' cannot be added to set of type '%@'",[objectToAdd class],classType]
                                    userInfo:nil];
        [myException raise];
    }
}
- (void)removeFromSet:(id)objectToRemove{
    if([objectToRemove isKindOfClass:classType]){
        BOOL canBeRemoved = false;
        for(id object in set){
            if([objectToRemove isEqualTo:object]){
                canBeRemoved = true;
            }
        }
        [set removeObject:objectToRemove];
        NSLog(@"%@",set);
    } else {

    }
}
- (BOOL)objectInSet:(id)objectToCheck{
    BOOL isInSet = false;
    if([objectToCheck isKindOfClass:classType]){
        for(id object in set){
            if([objectToCheck isEqualTo:object]){
                isInSet = true;
            }
        }
    }
    NSLog(@"%@",isInSet ? @"Is in set" : @"Isn't in set");
    return isInSet;
}
    
- (NSUInteger)objectsInSet{
    NSLog(@"%lu objects in set",[set count]);
    return [set count];
}


@end
