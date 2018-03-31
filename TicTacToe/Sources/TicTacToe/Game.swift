import Foundation

public class Game {

  public init(dimension: Int = 3) {
    assert(dimension >= 3)
    self.dimension = dimension
    self.board = Board(dimension: dimension)
  }

  public let dimension: Int

  internal var board: Board

}
