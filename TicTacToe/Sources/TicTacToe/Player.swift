import Foundation

protocol Player {
  init(mark: Mark)
  func move(board: Board) -> Coordinate
}
