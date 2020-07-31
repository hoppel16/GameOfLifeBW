//
//  Cell.swift
//  GameOfLife
//
//  Created by Hunter Oppel on 7/27/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation

class Cell {
    let id: UUID
    let x: Int
    let y: Int

    var state: State

    init(x: Int, y: Int) {
        self.id = UUID()
        self.x = x
        self.y = y
        self.state = .Dead

        randomizeState()
    }

    func randomizeState() {
        if Int.random(in: 0..<10) >= 5 {
            self.state = .Alive
        } else {
            self.state = .Dead
        }
    }
}

enum State: String {
    case Alive = "A"
    case Dead = "D"

    mutating func toggle() {
        switch self {
        case .Alive:
            self = .Dead
        case .Dead:
            self = .Alive
        }
    }
}
