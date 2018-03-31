import Foundation

public struct Position {
  public var coordinate: Coordinate
  public var mark: Mark
}

public class Board {

  public init(dimension: Int = 3) {
    assert(dimension >= 3)

    for row in 1...dimension {
      for col in 1...dimension {
        let coordinate = Coordinate(row: row, col: col)
        let position = Position(coordinate: coordinate, mark: .Empty)
        self.positions.append(position)
      }
    }

    self.dimension = dimension
  }

  public let dimension: Int

  internal var positions: [Position] = []

  public func isEmpty(coordinate: Coordinate) -> Bool {
    return self.mark(atCoordinate: coordinate) == .Empty
  }

  public func isX(coordinate: Coordinate) -> Bool {
    return self.mark(atCoordinate: coordinate) == .X
  }

  public func isO(coordinate: Coordinate) -> Bool {
    return self.mark(atCoordinate: coordinate) == .O
  }

  public func mark(atCoordinate: Coordinate) -> Mark {
    guard let position = self.position(atCoordinate: atCoordinate) else {
      return .Empty
    }
    return position.mark
  }

  // Returns true if the set was valid and succeeded.
  public func setMark(atCoordinate: Coordinate, mark: Mark) -> Bool {
    guard let position = self.position(atCoordinate: atCoordinate) else {
      return false
    }
    if position.mark == .Empty {
      position.mark = mark
      return true
    }
    return false
  }

  private func position(atCoordinate: Coordinate) -> Position? {
    for position in self.positions {
      let coordinate = position.coordinate
      if coordinate == atCoordinate {
        return position
      }
    }
    return nil
  }
}
