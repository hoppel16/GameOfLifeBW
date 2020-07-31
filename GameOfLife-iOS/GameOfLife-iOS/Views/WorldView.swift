//
//  WorldView.swift
//  GameOfLife-iOS
//
//  Created by Hunter Oppel on 7/31/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class WorldView: UIView {
    var world: World? = nil

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()

        func fillColorForCell (state: State) -> UIColor {
          switch state {
          case .Alive:
            return UIColor.blue
          case .Dead:
            return UIColor.lightGray
          }
        }

        func frameForCell (cell: Cell) -> CGRect {
            let dimensions = CGFloat(self.world!.dimensions)
            let cellSize = CGSize(width: self.bounds.width / dimensions, height: self.bounds.height / dimensions)
            return CGRect(x: CGFloat(cell.x) * cellSize.width, y:
                CGFloat(cell.y) * cellSize.height, width: cellSize.width, height: cellSize.height)
        }

        for cell in world!.cells {
            context!.setFillColor(fillColorForCell(state: cell.state).cgColor)
            context!.addRect(frameForCell(cell: cell))
            context!.fillPath()
        }
    }
}
