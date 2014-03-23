//
//  ReversiBoardTests.m
//  ReversiGame
//
//  Created by Scott Gardner on 3/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ReversiBoard.h"

@interface ReversiBoardTests : XCTestCase

@end

@implementation ReversiBoardTests
{
  ReversiBoard *_reversiBoard;
}

- (void)setUp
{
  [super setUp];
  _reversiBoard = [ReversiBoard new];
}

- (void)tearDown
{
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)test_makeMove_inPreGameState_nothingHappens
{
  // Arrange
  [_reversiBoard setToPreGameState];
  
  // Act
  
  
  // Assert
  XCTAssertNoThrowSpecificNamed([_reversiBoard makeMoveToColumn:3 andRow:3],
                                NSException,
                                NSRangeException,
                                @"\n*** Making a move in the pre-game state should do nothing.\n");
}

@end
