//
//  CustomSet.h
//  TTTSet
//
//  Created by Patrick Sanders on 27.11.15.
//  Copyright © 2015 turntotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSet : NSObject

- (instancetype)initWithType:(Class)setType;
- (void)addToSet:(id)objectToAdd;
- (void)removeFromSet:(id)objectToRemove;
- (BOOL)objectInSet:(id)objectToCheck;
- (NSUInteger)objectsInSet;

@end
