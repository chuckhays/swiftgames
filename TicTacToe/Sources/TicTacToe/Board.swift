import Foundation

public class Board {

  public convenience init(dimension: Int = 3) {
          assert(dimension >= 3)

          let
          emptyRow = [Mark?](count: dimension, repeatedValue: nil),
          allMarks = [[Mark?]](count: dimension, repeatedValue: emptyRow)

          self.init(dimension: dimension, marks: allMarks)
      }

      private init(dimension: Int, marks: [[Mark?]]) {
          self.dimension = dimension
          self.marks = marks
      }

      public let dimension: Int

      internal var marks: [[Mark?]]

}
