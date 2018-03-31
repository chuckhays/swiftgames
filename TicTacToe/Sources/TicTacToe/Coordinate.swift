import Foundation

public struct Coordinate {
  public var row,col : Int
}

extension Coordinate: Equatable {}

// MARK: Equatable

func ==<T>(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.row == rhs.row && lhs.col == rhs.col
}
