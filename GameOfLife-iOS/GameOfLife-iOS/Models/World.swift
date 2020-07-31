//
//  Grid.swift
//  GameOfLife
//
//  Created by Hunter Oppel on 7/27/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation

class World {
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

    func iterate() {
        let cellsAreNeighbours = {
            (op1: Cell, op2: Cell) -> Bool in
            let delta = (abs(op1.x - op2.x), abs(op1.y - op2.y))
            switch delta {
            case (1,1), (1,0), (0,1):
                return true
            default:
                return false
            }
        }

        let neighboursForCell = {
            (cell: Cell) -> [Cell] in
            return self.cells.filter { cellsAreNeighbours(cell, $0)}
        }

        let livingNeighboursForCell = {
            (cell: Cell) -> Int in
            neighboursForCell(cell).filter { $0.state == State.Alive }.count
        }

        let liveCells = cells.filter { $0.state == .Alive }
        let deadCells = cells.filter { $0.state == .Dead}

        let newLife = deadCells.filter { livingNeighboursForCell($0) == 3}
        let dyingCells = liveCells.filter { !(2...3 ~= livingNeighboursForCell($0))}

        for cell in newLife {
            cell.state = .Alive
        }

        for cell in dyingCells {
            cell.state = .Dead
        }
    }
}
