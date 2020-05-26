//
//  ViewController.swift
//  tictac
//
//  Created by Tadiwa Mangadze on 10/26/19.
//  Copyright © 2019 Tadiwa Mangadze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    
    @IBOutlet weak var newGame: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: Any) {
       
        
        if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true)
            {
                gameState[(sender as AnyObject).tag-1] = currentPlayer
                
                if (currentPlayer == 1)
                {
                    (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                    currentPlayer = 2
                }
                else
                {
                    (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                    currentPlayer = 1
                }
            }
            
            for combination in winningCombinations
            {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    gameIsActive = false
                    
                    if gameState[combination[0]] == 1
                    {
                        label.text = "X's HAVE WON!"
                        resetButton.isHidden = true
                    }
                    else
                    {
                        label.text = "O's HAVE WON!"
                        resetButton.isHidden = true
                    }
                    
                    playAgainButton.isHidden = false
                    label.isHidden = false
                }
            }
            
            gameIsActive = false
            
            for i in gameState
            {
                if i == 0
                {
                    gameIsActive = true
                    break
                }
            }
            
            if gameIsActive == false
            {
                label.text = "IT'S A DRAW"
                resetButton.isHidden = true
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
        

    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        currentPlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        resetButton.isHidden = false
        
        newGame.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {//1 second
            self.newGame.isHidden = true
        }
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }

    }
    
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func resetGame(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        currentPlayer = 1
        
        resetButton.isHidden = false
        playAgainButton.isHidden = true
        label.isHidden = true
        newGame.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {//1 second
            self.newGame.isHidden = true
        }
        
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

