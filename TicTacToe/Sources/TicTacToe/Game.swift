import Foundation

public class Game {

  public init(playerX: Player, playerO: Player, dimension: Int = 3) {
    assert(dimension >= 3)
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
    while true {
        // Ask for move.
        let coordinate = self.nextPlayer == .X ?
          self.playerX.move(board: self.board) :
          self.playerO.move(board: self.board)

        // Check validity of move.
        let result = board.setMark(atCoordinate:coordinate, mark:self.nextPlayer)

        if !result {
          // Error, return other player.
          print("Invalid move by player")
          return self.nextPlayer == .X ? .O : .X
        }

        //print("Player \(self.nextPlayer) played at \(coordinate)")

        // Check for winner.
        let winningMark = board.winner()
        if winningMark != .Empty {
          return winningMark
        }

        // Check for tie.
        if board.tie() {
          //print("Tie")
          return .Empty
        }

        // Move to next player.
        if self.nextPlayer == .X {
          self.nextPlayer = .O
        } else {
          self.nextPlayer = .X
        }
    }
    return self.nextPlayer
  }
}
