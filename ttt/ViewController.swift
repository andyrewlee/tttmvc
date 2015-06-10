//
//  ViewController.swift
//  ttt
//
//  Created by Jae Hoon Lee on 4/14/15.
//  Copyright (c) 2015 Jae Hoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var congratulationsMessageLabel: UILabel!
    
    @IBOutlet var squareButtons: [UIButton]!
    
    // Actions
    @IBAction func squareButtonPressed(sender: UIButton) {
        println(sender.tag)
        if sender.backgroundColor == UIColor.lightGrayColor() {
            if ticTacToe.currentTurn == "Red" {
                sender.backgroundColor = UIColor.redColor()
                ticTacToe.updateGameBoardAt(sender.tag, withColor: "Red")
                ticTacToe.currentTurn = "Blue"
            } else {
                sender.backgroundColor = UIColor.blueColor()
                ticTacToe.updateGameBoardAt(sender.tag, withColor: "Blue")
                ticTacToe.currentTurn = "Red"
            }
        }
        
        updateUI()
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        ticTacToe.resetGame()
        
        congratulationsMessageLabel.text = ""
        for button in squareButtons {
            button.backgroundColor = UIColor.lightGrayColor()
            button.enabled = true
        }
    }
    
    // Stored properties
    var ticTacToe = TicTacToeGame()

    func updateUI() {
        ticTacToe.checkGame()
        if ticTacToe.gameOver == true {
            if ticTacToe.winner == "Red" {
                congratulationsMessageLabel.text = "Congrats Red Won"
            } else {
                congratulationsMessageLabel.text = "Congrats Blue Won"
            }
            
            for button in squareButtons {
                button.enabled = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        congratulationsMessageLabel.text = ""
        for button in squareButtons {
            button.backgroundColor = UIColor.lightGrayColor()
            button.enabled = true
        }
    }
}

