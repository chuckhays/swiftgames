import Foundation

public class Game {

  public init(dimension: Int = 3) {
    assert(dimension >= 3)
    let board = Board(dimension: dimension)
  }

  public let dimension: Int

  internal var board: Board

}
