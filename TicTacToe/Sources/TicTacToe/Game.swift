import Foundation

public class Game {

  public init(playerX: Player, playerO: Player, dimension: Int = 3) {
    assert(dimension >= 3)
    assert(playerX != nil)
    assert(playerX != nil)
    self.playerX = playerX
    self.playerO = playerO
    self.dimension = dimension
    self.nextPlayer = .X
    self.board = Board(dimension: dimension)
  }

  public let dimension: Int
  public let playerX: Player
  public let playerO: Player

  internal var board: Board
  private var nextPlayer: Mark

  public func run() -> Mark {
    // While no one has won, ask the next player for their move.

    var winner = false
    while !winner {
        // Ask for move.
        let coordinate = self.nextPlayer == .X ?
          self.playerX.move(board: self.board) :
          self.playerO.move(board: self.board)

        // Check validity of move.
        let result = board.setMark(atCoordinate:coordinate, mark:self.nextPlayer)

        if !result {
          // Error, return other player.
          print("Invalid move by player")

        }

        // Check for winner.

        // Move to next player.
        if self.nextPlayer == .X {
          self.nextPlayer = .O
        } else {
          self.nextPlayer = .X
        }
    }
  }
}
