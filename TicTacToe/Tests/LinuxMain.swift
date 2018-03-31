import XCTest
@testable import TicTacToeTests

XCTMain([
    testCase(TicTacToeTests.allTests),
    testCase(BoardTests.allTests),
])
