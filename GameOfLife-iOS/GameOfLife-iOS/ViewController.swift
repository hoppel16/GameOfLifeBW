//
//  ViewController.swift
//  GameOfLife-iOS
//
//  Created by Hunter Oppel on 7/31/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let world = World()
    var timer: Timer? = nil

    private let worldLock = NSLock()
    private var isIterating = false {
        didSet {
            iterate()
        }
    }

    @IBOutlet var worldView: WorldView!
    @IBOutlet var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        worldView.world = self.world
    }
    
    @IBAction func toggleIterating(_ sender: Any) {
        isIterating.toggle()
        startButton.isSelected.toggle()

        if isIterating {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(iterate), userInfo: nil, repeats: true)
        }
    }

    @IBAction func randomizeCells(_ sender: Any) {
        for cell in world.cells {
            cell.randomizeState()
        }
        self.worldView.setNeedsDisplay()
    }

    @objc func iterate() {
        if isIterating {
            print("Iterating")
            self.world.iterate()
            self.worldView.setNeedsDisplay()
        } else {
            timer?.invalidate()
        }
    }
}

