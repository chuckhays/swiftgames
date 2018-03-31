import XCTest
@testable import TicTacToeTests

XCTMain([
    testCase(TicTacToeTests.allTests),
    testCase(BoardTests.allTests),
    testCase(GameTests.allTests),
])
