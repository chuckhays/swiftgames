import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testCreateGame() {
      let x = RandomPlayer(mark: .X)
      let o = RandomPlayer(mark: .O)
      let game1 = Game(playerX: x, playerO: o)
      XCTAssertNotNil(game1)
    }


    static var allTests = [
        ("testCreateGame", testCreateGame),
    ]
}
