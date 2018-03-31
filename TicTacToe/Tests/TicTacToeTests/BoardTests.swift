import XCTest
@testable import TicTacToe

class BoardTests: XCTestCase {
    func testCreateBoard() {
      let board1 = Board()
      XCTAssertNotNil(board1)
    }


    static var allTests = [
        ("testCreateBoard", testCreateBoard),
    ]
}
