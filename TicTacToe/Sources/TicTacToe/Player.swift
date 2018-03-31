import Foundation

public protocol Player {
  init(mark: Mark)
  func move(board: Board) -> Coordinate
}
