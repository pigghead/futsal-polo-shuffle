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
    @Published var quad1:[Int]?
    @Published var quad2:[Int]?
    @Published var quad3:[Int]?
    @Published var quad4:[Int]?
    
    // The center card
    @Published var center:Int?
    
    // find the player that will go first
    private func chooseStartPlayer() -> Int {
        return Int.random(in: 1...2)
    }
    
    // Serves as our "init" function
    public func StartGame(Deck: Deck) {
        currentPlayer = chooseStartPlayer()
        
        quad1?.append(Deck.popCard())
        quad2?.append(Deck.popCard())
        quad3?.append(Deck.popCard())
        quad4?.append(Deck.popCard())
        
        center = Deck.popCard()
    }
}
