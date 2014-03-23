//
//  GameBoardTests.m
//  ReversiGame
//
//  Created by Scott Gardner on 3/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameBoard.h"

@interface GameBoardTests : XCTestCase

@end

@implementation GameBoardTests
{
  GameBoard *_board;
}

- (void)setUp
{
  [super setUp];
  _board = [GameBoard new];
}

- (void)tearDown
{
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)test_setAndGetCellState_setValidCell_cellStateChanged
{
  // Arrange
  [_board setCellState:BoardCellStateWhitePiece forColumn:4 andRow:5];
  
  // Act
  BoardCellState state = [_board cellStateAtColumn:4 andRow:5];
  
  // Assert
  XCTAssertEqual(BoardCellStateWhitePiece, state, @"\n*** The cell should be white.\n");
}

- (void)test_setCellState_withInvalidCoords_exceptionThrown
{
  // Assert
  XCTAssertThrowsSpecificNamed([_board setCellState:BoardCellStateBlackPiece forColumn:10 andRow:7],
                               NSException,
                               NSRangeException,
                               @"\n*** Out-of-bounds board set should raise an exception.\n");
}

- (void)test_getCellState_withInvalidCoords_exceptionThrown
{
  // Assert
  XCTAssertThrowsSpecificNamed([_board cellStateAtColumn:7 andRow:10],
                               NSException,
                               NSRangeException,
                               @"\n*** Out-of-bounds board access should raise an exception.\n");
}


- (void)test_clearBoard_withPiecesOnBoard_boardIsCleared
{
  // Arrange
  [_board setCellState:BoardCellStateBlackPiece forColumn:1 andRow:1];
  [_board setCellState:BoardCellStateWhitePiece forColumn:2 andRow:2];
  
  // Act
  [_board clearBoard];
  
  // Assert
  XCTAssertEqual([_board cellStateAtColumn:1 andRow:1], BoardCellStateEmpty, @"\n*** Cell state should be empty but is not.\n");
  XCTAssertEqual([_board cellStateAtColumn:2 andRow:2], BoardCellStateEmpty, @"\n*** Cell state should be empty but is not.\n");
}

- (void)test_getCellCount_withPiecesOnBoard_matchesActualNumberOfPieces
{
  // Arrange
  int numberBlackPieces = arc4random() % 4 + 1;
  int numberWhitePieces = arc4random() % 4 + 1;
  int i = 0;
  NSLog(@"\n*** Black: %d, White: %d\n", numberBlackPieces, numberWhitePieces);
  
  // Act
  for (; i < numberBlackPieces; i++) {
    [_board setCellState:BoardCellStateBlackPiece forColumn:i andRow:i];
  }
  
  for (; i < numberWhitePieces + numberBlackPieces; i++) {
    [_board setCellState:BoardCellStateWhitePiece forColumn:i andRow:i];
  }
  
  // Assert
  
  XCTAssertEqual([_board countCellsWithState:BoardCellStateBlackPiece], numberBlackPieces, @"\n*** Count of cells with a black piece should be %d but is actually %d.\n", numberBlackPieces, [_board countCellsWithState:BoardCellStateBlackPiece]);
  XCTAssertEqual([_board countCellsWithState:BoardCellStateWhitePiece], numberWhitePieces, @"\n*** Count of cells with a white piece should be %d but is actually %d.\n", numberWhitePieces, [_board countCellsWithState:BoardCellStateWhitePiece]);
}

@end
