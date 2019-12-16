//
//  Deck.swift
//  Futsal Shuffle
//
//  Created by Justin Armstrong on 12/15/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import Foundation

class Deck: ObservableObject {
    @Published var deck:[Int] = [
        1, 1, 1, 1, 1,
        2, 2, 2, 2, 2,
        3, 3, 3, 3, 3,
        4, 4, 4, 4, 4,
        5, 5, 5, 5, 5,
        6, 6, 6, 6, 6,
        7, 7, 7, 7, 7,
        8, 8, 8, 8, 8,
        9, 9, 9, 9, 9
    ]
    
    init() {
        // Every time a deck is created, shuffle it
        deck = deck.shuffled()
    }
    
    public func shuffleDeck() {
        deck = deck.shuffled()
    }
    
    // Pop the next card to be used
    public func drawCard() -> Int {
        let nextCard = deck.removeLast()
        return nextCard
    }
}
