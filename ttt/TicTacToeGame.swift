//
//  TicTacToeGame.swift
//  ttt
//
//  Created by Jae Hoon Lee on 4/14/15.
//  Copyright (c) 2015 Jae Hoon Lee. All rights reserved.
//

import Foundation

class TicTacToeGame {
    
    var gameBoard: [Int]
    var gameOver: Bool
    var winner: String?
    var currentTurn: String
    
    
    init() {
        gameBoard = [0, 0, 0,
                     0, 0, 0,
                     0, 0, 0]
        gameOver = false
        currentTurn = "Red"
    }
    
    func updateGameBoardAt(index: Int, withColor: String) {
        if withColor == "Red" {
            gameBoard[index] = 1
        } else {
            gameBoard[index] = 2
        }
    }
    
    func resetGame() {
        gameBoard = [0, 0, 0,
                     0, 0, 0,
                     0, 0, 0]
        gameOver = false
    }
    
    func checkGame() {
        checkRows()
        checkColumns()
        checkDiagonals()
    }
    
    func checkRows() {
        for var i = 0; i <= 6; i += 3 {
            if gameBoard[i] != 0 && (gameBoard[i] == gameBoard[i + 1] && gameBoard[i + 1] == gameBoard[i + 2]) {
                declareWinner(gameBoard[i])
            }
        }
    }
    
    func checkColumns() {
        for var i = 0; i <= 2; ++i {
            if gameBoard[i] != 0 && (gameBoard[i] == gameBoard[i + 3] && gameBoard[i + 3] == gameBoard[i + 6]) {
                declareWinner(gameBoard[i])
            }
        }
    }
    
    func checkDiagonals() {
        if gameBoard[4] != 0 && (leftDiagonal() || rightDiagonal()) {
            declareWinner(gameBoard[4])
        }
    }
    
    func leftDiagonal() -> Bool {
        return gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]
    }
    
    func rightDiagonal() -> Bool {
        return gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6]
    }
    
    func declareWinner(winningIndex: Int) {
        gameOver = true
        if winningIndex == 1 {
            winner = "Red"
        } else {
            winner = "Blue"
        }
    }
}