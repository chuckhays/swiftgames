import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testCreateGame() {
      let game1 = Game()
      XCTAssertNotNil(game1)
    }


    static var allTests = [
        ("testCreateGame", testCreateGame),
    ]
}
