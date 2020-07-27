//
//  Cell.swift
//  GameOfLife
//
//  Created by Hunter Oppel on 7/27/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation

class Cell {
    let x: Int
    let y: Int

    var state: State

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.state = .Dead
    }
}

enum State {
    case Alive
    case Dead
}
