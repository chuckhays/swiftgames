import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testCreateGame() {
      let x = RandomPlayer(mark: .X)
      let o = RandomPlayer(mark: .O)
      let game1 = Game(playerX: x, playerO: o)
      let winner = game1.run()
      print(winner)
      XCTAssertNotNil(game1)
    }

    func testManyGames() {
      var xCount = 0
      var oCount = 0
      var tieCount = 0
      for i in 1...1000 {
        let x = RandomPlayer(mark: .X)
        let o = RandomPlayer(mark: .O)
        let game = Game(playerX: x, playerO: o)
        let winner = game.run()
        print(winner)
        if winner == .X {
          xCount += 1
        } else if winner == .O {
          oCount += 1
        } else {
          tieCount += 1
        }
      }
      print("X: \(xCount) O: \(oCount) tie:\(tieCount)")
    }


    static var allTests = [
        ("testCreateGame", testCreateGame),
        ("testManyGames", testManyGames),
    ]
}
