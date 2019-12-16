//
//  Game.swift
//  Futsal Shuffle
//
//  Created by Justin Armstrong on 12/15/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import Foundation

class Game: ObservableObject {
    // Start the game by creating and getting a deck
    
    @Published var currentPlayer:Int?
    
    private func chooseStartPlayer() -> Int {
        return Int.random(in: 1...2)
    }
    
    public func StartGame() {
        currentPlayer = chooseStartPlayer()
    }
}
