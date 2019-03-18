//
//  ViewController.swift
//  Concentration
//
//  Created by inna on 21/02/2019.
//  Copyright © 2019 inna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var numberOfPairOfCards: Int {
            return ((cardButtons.count + 1) / 2)
    }
    
    private lazy var game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip count: \(flipCount)"
        }
    }
    
    var emojiChoises = "👻🎃☃️🌈🦇🕷🧙‍♀️"

    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons.")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.1212199505, green: 0.1653521473, blue: 1, alpha: 1)
            }
        }
    }
    
    private var emoji = Dictionary<Card, String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoises.count > 0 {
            let randomIndex = emojiChoises.index(emojiChoises.startIndex, offsetBy: emojiChoises.count.arc4random)
            emoji[card] = String(emojiChoises.remove(at: randomIndex))
        }
        
        if emoji[card] != nil {
            return emoji[card]!
        } else {
            return "?"
        }
    }
    
}

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

