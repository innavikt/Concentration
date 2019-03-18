//
//  Card.swift
//  Concentration
//
//  Created by inna on 27/02/2019.
//  Copyright © 2019 inna. All rights reserved.
//

import Foundation

struct Card: Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var hashValue: Int {
        return identifier
    }
    
    
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

