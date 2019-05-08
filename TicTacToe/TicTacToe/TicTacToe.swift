//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by 徐一鸣 on 3/16/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

// default position = 0
// assume x is first player with value 1
// assume O is second player with value 2
class TicTacToe {

    public enum GameState : String {
        case xTern = "Player1's tern"
        case oTern = "Player2's tern"
        case Tied = "Game Tied"
        case xWin = "Player1 wins"
        case oWin = "Player2 wins"
    }

    public var board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)

    public func resetBoard() {
        board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    }

    private let winningBoard = [
                                [[1,1,1],[0,0,0],[0,0,0]],
                                [[0,0,0],[1,1,1],[0,0,0]],
                                [[0,0,0],[0,0,0],[1,1,1]],

                                [[1,0,0],[1,0,0], [1,0,0]],
                                [[0,1,0],[0,1,0], [0,1,0]],
                                [[0,0,1],[0,0,1], [0,0,1]],

                                [[1,0,0],[0,1,0], [0,0,1]],
                                [[0,0,1],[0,1,0], [1,0,0]],
                                ]

    public func checkStatus() -> GameState {
        if checkForWinner(val: 1) { // x
            return .xWin
        } else if checkForWinner(val: 2) { // O
            return .oWin
        } else {
            var xCount = 0, oCount = 0, dotCount = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    switch board[i][j] {
                    case 1: // x
                        xCount += 1
                    case 2: // O
                        oCount += 1
                    default:
                        dotCount += 1
                    }
                }
            }

            if dotCount == 0 {
                return .Tied
            } else if xCount > oCount {
                return .oTern
            } else {
                return .xTern
            }
        }
    }

    private func checkForWinner(val: Int) -> Bool {
        var counter = 0
        for wBoard in winningBoard {
            counter = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    if wBoard[i][j] == 1 {
                        if board[i][j] == val {
                            counter += 1
                        }
                    }
                }
            }
            if (counter == 3) {
                return true
            }
        }
        return false
    }

}
