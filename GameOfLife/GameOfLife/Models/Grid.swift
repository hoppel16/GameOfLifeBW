//
//  Grid.swift
//  GameOfLife
//
//  Created by Hunter Oppel on 7/27/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation

class Grid {
    var cells: [Cell]
    let dimensions: Int = 20

    init() {
        cells = [Cell]()

        for x in 0..<dimensions {
            for y in 0..<dimensions {
                cells.append(Cell(x: x, y: y))
            }
        }
    }

    subscript(x: Int, y: Int) -> Cell? {
        return cells.filter { $0.x == x && $0.y == y }.first
    }
}
