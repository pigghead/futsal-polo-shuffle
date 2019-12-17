//
//  ContentView.swift
//  Futsal Shuffle
//
//  Created by Justin Armstrong on 12/15/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newDeck:Deck = Deck()
    @ObservedObject var newGame:Game = Game()
    @State private var drawnCard:Int = 0
    
    var body: some View {
        ZStack {
            Image("background").resizable().edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    Text("Player " + String(self.newGame.currentPlayer!) + "'s turn")
                    Spacer()
                    Image("back1")
                        .resizable().frame(width: 70, height: 100)
                    Spacer()
                    HStack {
                        Image("back1")
                            .resizable().frame(width: 70, height: 100)
                            .padding(.leading)
                        Spacer()
                        Text("Center")
                        Spacer()
                        Image("back1")
                            .resizable().frame(width: 70, height: 100)
                            .padding(.trailing)
                    }
                    Spacer()
                    Image("back1")
                        .resizable().frame(width: 70, height: 100)
                    Spacer()
                    Image("card" + String(drawnCard))
                        .resizable().frame(width: 70, height: 100)
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    self.drawnCard = self.newDeck.drawCard()
                    // Advance the player's turn
                    self.newGame.ChangeTurn()
                }) {
                    Text("Draw")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
