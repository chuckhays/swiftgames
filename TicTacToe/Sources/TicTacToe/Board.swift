import Foundation

public class Position {
  public var coordinate: Coordinate
  public var mark: Mark

  public init(coordinate: Coordinate, mark: Mark) {
    self.coordinate = coordinate
    self.mark = mark
  }
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

  public func isEmpty(atCoordinate: Coordinate) -> Bool {
    return self.mark(atCoordinate: atCoordinate) == .Empty
  }

  public func isX(atCoordinate: Coordinate) -> Bool {
    return self.mark(atCoordinate: atCoordinate) == .X
  }

  public func isO(atCoordinate: Coordinate) -> Bool {
    return self.mark(atCoordinate: atCoordinate) == .O
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

  public func tie() -> Bool {
    let emptyPositions = self.positions.filter(isEmptyPosition)
    return emptyPositions.count == 0
  }

  public func winner() -> Mark {
    // Check verticals.
    for col in 1...self.dimension {
      let mark = self.winner(col:col)
      if mark != .Empty {
        return mark
      }
    }
    // Check horizontals.
    for row in 1...self.dimension {
      let mark = self.winner(row:row)
      if mark != .Empty {
        return mark
      }
    }

    // Check diagonals.
    let diag1 = self.firstDiagonalWinner()
    if diag1 != .Empty {
      return diag1
    }
    let diag2 = self.secondDiagonalWinner()
    if diag2 != .Empty {
      return diag2
    }

    return .Empty
  }

  private func winner(row: Int) -> Mark {
    let firstMark = self.mark(atCoordinate: Coordinate(row: row, col: 1))
    if firstMark == .Empty {
      return .Empty
    }
    for col in 2...self.dimension {
        let coordinate = Coordinate(row: row, col: col)
        let nextMark = self.mark(atCoordinate: coordinate)
        if nextMark != firstMark {
          return .Empty
        }
    }
    return firstMark
  }

  private func winner(col: Int) -> Mark {
    let firstMark = self.mark(atCoordinate: Coordinate(row: 1, col: col))
    if firstMark == .Empty {
      return .Empty
    }
    for row in 2...self.dimension {
        let coordinate = Coordinate(row: row, col: col)
        let nextMark = self.mark(atCoordinate: coordinate)
        if nextMark != firstMark {
          return .Empty
        }
    }
    return firstMark
  }

  private func firstDiagonalWinner() -> Mark {
    let firstMark = self.mark(atCoordinate: Coordinate(row: 1, col: 1))
    if firstMark == .Empty {
      return .Empty
    }
    for next in 2...self.dimension {
        let coordinate = Coordinate(row: next, col: next)
        let nextMark = self.mark(atCoordinate: coordinate)
        if nextMark != firstMark {
          return .Empty
        }
    }
    return firstMark
  }

  private func secondDiagonalWinner() -> Mark {
    let firstMark = self.mark(atCoordinate: Coordinate(row: 1, col: self.dimension))
    if firstMark == .Empty {
      return .Empty
    }
    for next in 2...self.dimension {
        let coordinate = Coordinate(row: next, col: self.dimension - next + 1)
        let nextMark = self.mark(atCoordinate: coordinate)
        if nextMark != firstMark {
          return .Empty
        }
    }
    return firstMark
  }

  func isEmptyPosition(position: Position) -> Bool {
    return position.mark == .Empty
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
