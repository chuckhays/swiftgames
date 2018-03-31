import Foundation

public protocol Player {
  init(mark: Mark)
  func move(board: Board) -> Coordinate
}

public class RandomPlayer : Player {

  public func move(board: Board) -> Coordinate {
    // Find an open spot.
    var orderedRows = [Int]()
    var orderedCols = [Int]()
    for r in 1...board.dimension {
      orderedRows.append(r)
      orderedCols.append(r)
    }

    // Pick them in random order.
    var rows = [Int]()
    var cols = [Int]()

    while orderedRows.count > 0 {
      let r = orderedRows.remove(at:random(orderedRows.count))
      rows.append(r)
    }
    while orderedCols.count > 0{
      let c = orderedCols.remove(at:random(orderedCols.count))
      cols.append(c)
    }

    // Now that we have our rows/cols ordered randomly, look for the first
    // empty spot to play.
    for row in rows {
      for col in cols {
        let coordinate = Coordinate(row: row, col: col)
        if board.isEmpty(atCoordinate: coordinate) {
          return coordinate
        }
      }
    }
    // Couldn't find one.
    return Coordinate(row: 1, col: 1)
  }

  func random(_ n:Int) -> Int
  {
    return Int(random() % n)
  }
}
