//
//  Game.swift
//  Futsal Shuffle
//
//  Created by Justin Armstrong on 12/15/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import Foundation

class Game: ObservableObject {
    
    // All observed objects
    //@ObservedObject var
    
    // Whose turn is it?
    @Published var currentPlayer:Int?
    
    // These are the four quadrants/ discard+swap piles
    @Published var pile1:[Int]?
    @Published var pile2:[Int]?
    @Published var pile3:[Int]?
    @Published var pile4:[Int]?
    
    // The center card
    @Published var targetCard:Int?
    
    // find the player that will go first
    private func chooseStartPlayer() -> Int {
        return Int.random(in: 1...2)
    }
    
    // Serves as our "init" function
    public func StartGame(Deck: Deck) {
        currentPlayer = chooseStartPlayer()
        
        pile1?.append(Deck.drawCard())
        pile2?.append(Deck.drawCard())
        pile3?.append(Deck.drawCard())
        pile4?.append(Deck.drawCard())
        
        targetCard = Deck.drawCard()
    }
}
