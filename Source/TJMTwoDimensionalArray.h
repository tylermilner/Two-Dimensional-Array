//
//  TJMTwoDimensionalArray.h
//  Two Dimensional Array
//
//  Created by Tyler Milner on 3/27/14.
//  Copyright (c) 2014 Tyler Milner. All rights reserved.
//

//
//  TODO: Would be nice to have initializer that takes a creation block used for creating the null objects.
//  TODO: Would be nice to have an 'enumerateUsingBlock:^(NSUInteger row, NSUInteger column, BOOL *stop)' method.
//

#import <Foundation/Foundation.h>

@interface TJMTwoDimensionalArray : NSObject <NSCoding>

+ (id)nullObject;

- (instancetype)initWithNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns;

@property (assign, nonatomic) NSUInteger numberOfRows;
@property (assign, nonatomic) NSUInteger numberOfColumns;

- (id)objectAtRow:(NSUInteger)row column:(NSUInteger)column;
- (void)setObject:(id)object atRow:(NSUInteger)row column:(NSUInteger)column;
- (void)clearArray;

- (NSIndexPath *)indexPathForObject:(id)object;

@end
