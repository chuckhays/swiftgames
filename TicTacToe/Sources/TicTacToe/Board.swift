import Foundation

public struct Position {
  public var coordinate: Coordinate
  public var mark: Mark
}

public class Board {

  public convenience init(dimension: Int = 3) {
    assert(dimension >= 3)

    let emptyRow = [Mark?](repeating: nil, count: dimension)
    let allMarks = [[Mark?]](repeating: emptyRow, count: dimension)

    self.init(dimension: dimension, marks: allMarks)
  }

  private init(dimension: Int, marks: [[Mark?]]) {
    self.dimension = dimension
    self.marks = marks
  }

  public let dimension: Int

  internal var marks: [[Mark?]]

}
