//
//  TJMViewController.m
//  Two Dimensional Array
//
//  Created by Soz on 8/17/14.
//  Copyright (c) 2014 Tyler Milner. All rights reserved.
//

#import "TJMViewController.h"
#import "TJMTwoDimensionalArray.h"

#define kNumRows 4
#define kNumCols 4

@interface TJMViewController ()

@property (strong, nonatomic) TJMTwoDimensionalArray *twoDimensionalArray;

@end

@implementation TJMViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testTwoDimensionalArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Properties

- (TJMTwoDimensionalArray *)twoDimensionalArray
{
    if (!_twoDimensionalArray)
    {
        _twoDimensionalArray = [[TJMTwoDimensionalArray alloc] initWithNumberOfRows:kNumRows numberOfColumns:kNumCols];
    }
    
    return _twoDimensionalArray;
}

#pragma mark - Two Dimensional Array

- (void)testTwoDimensionalArray
{
    NSLog(@"Initial array: %@", self.twoDimensionalArray);
    
    [self.twoDimensionalArray setObject:@"(0,1)" atRow:0 column:1];
    [self.twoDimensionalArray setObject:[NSString stringWithFormat:@"(%d,%d)", kNumRows - 1, kNumCols - 1] atRow:kNumRows - 1 column:kNumCols - 1];
    [self.twoDimensionalArray setObject:@"(3,0)" atRow:3 column:0];
    
    NSLog(@"Added some elements: %@", self.twoDimensionalArray);
}

@end
