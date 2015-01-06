//
//  TJMTwoDimensionalArray.m
//  Two Dimensional Array
//
//  Created by Tyler Milner on 3/27/14.
//  Copyright (c) 2014 Tyler Milner. All rights reserved.
//

#import "TJMTwoDimensionalArray.h"

#define kNSCodingArrayKey @"array"
#define kNSCodingNumberOfRowsKey @"numberOfRows"
#define kNSCodingNumberOfColumnsKey @"numberOfColumns"

@interface TJMTwoDimensionalArray()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation TJMTwoDimensionalArray

+ (id)nullObject
{
    return [NSNull null];
}

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _numberOfRows = 0;
        _numberOfColumns = 0;
        [self twoDimensionalArrayCommonInit];
    }
    
    return self;
}

- (instancetype)initWithNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns
{
    self = [super init];
    
    if (self)
    {
        _numberOfRows = numberOfRows;
        _numberOfColumns = numberOfColumns;
        [self twoDimensionalArrayCommonInit];
    }
    
    return self;
}

- (instancetype)initWithNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns array:(NSMutableArray *)array
{
    self = [super init];
    
    if (self)
    {
        _numberOfRows = numberOfRows;
        _numberOfColumns = numberOfColumns;
        _array = array;
    }
    
    return self;
}

- (void)twoDimensionalArrayCommonInit
{
    _array = [@[] mutableCopy];
    
    [self fillTwoDimensionalArray:_array withNullObjectsForNumberOfRows:_numberOfRows numberOfColumns:_numberOfColumns];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.array forKey:kNSCodingArrayKey];
    [aCoder encodeInteger:self.numberOfRows forKey:kNSCodingNumberOfRowsKey];
    [aCoder encodeInteger:self.numberOfColumns forKey:kNSCodingNumberOfColumnsKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSMutableArray *array = [aDecoder decodeObjectForKey:kNSCodingArrayKey];
    NSUInteger numberOfRows = [aDecoder decodeIntegerForKey:kNSCodingNumberOfRowsKey];
    NSUInteger numberOfColumns = [aDecoder decodeIntegerForKey:kNSCodingNumberOfColumnsKey];
    
    return [self initWithNumberOfRows:numberOfRows numberOfColumns:numberOfColumns array:array];
}

#pragma mark - Properties

- (void)setNumberOfRows:(NSUInteger)numberOfRows
{
    if (numberOfRows > _numberOfRows)
    {
        for (NSUInteger row = self.numberOfRows - 1; row < numberOfRows; row++)
        {
            NSMutableArray *columnArray = [[NSMutableArray alloc] initWithCapacity:self.numberOfColumns];
            [self fillArray:columnArray withNullObjectsOfCount:self.numberOfColumns];
            
            self.array[row] = columnArray;
        }
    }
    else if (numberOfRows < _numberOfRows)
    {
        NSUInteger numberOfRowsToDelete = _numberOfRows - numberOfRows;
        
        for (NSUInteger i = 0; i < numberOfRowsToDelete; i++)
        {
            [self.array removeLastObject];
        }
    }
    
    _numberOfRows = numberOfRows;
}

- (void)setNumberOfColumns:(NSUInteger)numberOfColumns
{
    if (numberOfColumns > _numberOfColumns)
    {
        for (NSUInteger row = 0; row < self.numberOfRows; row++)
        {
            for (NSUInteger col = self.numberOfColumns - 1; col < numberOfColumns; col++)
            {
                self.array[row][col] = [NSNull null];
            }
        }
    }
    else if (numberOfColumns < _numberOfColumns)
    {
        for (NSUInteger row = 0; row < self.numberOfRows; row++)
        {
            NSUInteger numberOfColumnsToDelete = _numberOfColumns - numberOfColumns;
            
            for (NSUInteger i = 0; i < numberOfColumnsToDelete; i++)
            {
                [self.array[row] removeLastObject];
            }
        }
    }
    
    _numberOfColumns = numberOfColumns;
}

#pragma mark - Public

- (id)objectAtRow:(NSUInteger)row column:(NSUInteger)column
{
    // TODO: Parameter validation
    id object = self.array[row][column];
    return object;
}

- (void)setObject:(id)object atRow:(NSUInteger)row column:(NSUInteger)column
{
    self.array[row][column] = object;
}

- (NSIndexPath *)indexPathForObject:(id)object
{
    NSIndexPath *indexPath;
    
    for (NSUInteger row = 0; row < self.numberOfRows; row++)
    {
        for (NSUInteger col = 0; col < self.numberOfColumns; col++)
        {
            id arrayObject = self.array[row][col];
            
            if (arrayObject == object)
            {
                indexPath = [NSIndexPath indexPathForRow:row inSection:col];
            }
        }
    }
    
    
    return indexPath;
}

- (void)clearArray
{
    [self fillTwoDimensionalArray:self.array withNullObjectsForNumberOfRows:_numberOfRows numberOfColumns:_numberOfColumns];
}

- (NSString *)description
{
    NSMutableString *description = [[super description] mutableCopy];
    
    for (NSUInteger row = 0; row < self.numberOfRows; row++)
    {
        for (NSUInteger col = 0; col < self.numberOfColumns; col++)
        {
            id object = self.array[row][col];
            
            [description appendFormat:@"%@", object];
        }
        
        [description appendString:@"\n"];
    }
    
    return description;
}

#pragma mark - Private

- (void)fillTwoDimensionalArray:(NSMutableArray *)array withNullObjectsForNumberOfRows:(NSUInteger)numberOfRows numberOfColumns:(NSUInteger)numberOfColumns
{
    for (NSUInteger row = 0; row < numberOfRows; row++)
    {
        NSMutableArray *columnArray = [[NSMutableArray alloc] initWithCapacity:numberOfColumns];
        [self fillArray:columnArray withNullObjectsOfCount:numberOfColumns];
        
        array[row] = columnArray;
    }
}

- (void)fillArray:(NSMutableArray *)array withNullObjectsOfCount:(NSUInteger)count
{
    for (NSUInteger i = 0; i < count; i++)
    {
        array[i] = [NSNull null];
    }
}

@end
