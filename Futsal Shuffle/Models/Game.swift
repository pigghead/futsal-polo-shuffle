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
    
    init() {
        currentPlayer = chooseStartPlayer()
    }
    
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
    
    // Switch from one player's turn to the next
    public func EndTurn(currentDeck: Deck, player1: Player, player2: Player) {
        if currentDeck.deck.count == 0 {
            //EndGame(player1: player1, player2: player2)
        } else {
            ChangeTurn()
        }
    }
    
    // Change from the current player's turn to the next player's turn
    public func ChangeTurn() {
        if currentPlayer == 1 {
            currentPlayer = 2
        } else if currentPlayer == 2 {
            currentPlayer = 1
        }
    }
    
    // Check which player had the highest score
    // Returns the winning player
    public func EndGame(player1: Player, player2: Player) -> Int {
        if player1.playerScore > player2.playerScore {
            return 1
        } else if player2.playerScore > player1.playerScore {
            return 2
        }

        return 3
    }
}
