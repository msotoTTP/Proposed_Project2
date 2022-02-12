//
//  ViewController.swift
//  tictactoetest
//
//  Created by Mathew Soto on 11/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    @IBOutlet var squares: [UIButton]!
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func squarePressed(_ sender: UIButton) {
        let indexOfPresssedSquare = squares.firstIndex(of: sender)!
        
        //if a move is successfully played, then set the button to the symbol that played the move
        //and update the display label with who goes next
        if game.playMove(at: indexOfPresssedSquare) {
            sender.setTitle(game.previousMove.rawValue, for: .normal)
            displayLabel.text = "\(game.currentMove) goes next"
        }
        //if someone has won, update the display text and enable the restart button so they can play a new game
        if game.someoneHasWon() {
            displayLabel.text = "\(game.previousMove.rawValue) wins!"
            restartButton.isEnabled = true
        }
        //if the game is tied, update the display text and enable the restart button so they can play a new game
        if game.gameIsTied() {
            displayLabel.text = "It's a tie!"
            restartButton.isEnabled = true
        }
    }
    
    @IBAction func restartGame() {
        //reset label
        displayLabel.text = "X goes next"
        
        //reset square buttons
        for square in squares {
            square.setTitle("", for: .normal)
        }
        
        //reset game
        game = Game()
        
        //disable restart button
        restartButton.isEnabled = false
    }
}

