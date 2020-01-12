//
//  ContentView.swift
//  Futsal Shuffle
//
//  Created by Justin Armstrong on 12/15/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Observed object for data interacting with one another
    // MARK: - OBSERVABLES -
    @ObservedObject var newDeck:Deck = Deck()
    @ObservedObject var newGame:Game = Game()
    @State private var drawnCard:Int = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable().edgesIgnoringSafeArea(.all)
            VStack {
                VStack {  // Main container
                    //Text("Player " + String(self.newGame.currentPlayer!) + "'s turn")
                    Spacer()
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.largeTitle)
                        Image("back1")
                            .padding()
                        VStack {
                            Text("Player 2")
                            Text("Score")
                        }
                    }
                    Spacer()
                    Image("back1")
                        .resizable().frame(width: 55, height: 85)
                        .padding()
                    Spacer()
                    HStack {
                        Image("back1")
                            .resizable().frame(width: 55, height: 85)
                            .padding(.leading)
                        Spacer()
                        Text("Center")
                        Spacer()
                        Image("back1")
                            .resizable().frame(width: 55, height: 85)
                            .padding(.trailing)
                    }
                    Spacer()
                    Image("back1")
                        .resizable().frame(width: 55, height: 85)
                    Spacer()
                    HStack {
                        VStack {
                            Text("Player 1")
                            Text("Score")
                        }
                        if drawnCard == 0 {
                            Image("back1")
                                .resizable().frame(width: 55, height: 85)
                                .padding()
                                .opacity(0.2)
                        } else {
                            Image("card" + String(drawnCard))
                                .resizable().frame(width: 55, height: 85)
                                .padding()
                        }
                        Image(systemName: "person").clipShape()
                            //.font(.largeTitle)
                    }
                }
                
                Spacer()
                
                HStack {  // "Action" pane (draw, discard)
                    Button(action: {
                        self.drawnCard = self.newDeck.drawCard()
                        // Advance the player's turn
                        self.newGame.ChangeTurn()
                    }) {
                        Text("Draw")
                    }.padding(.leading, 50)
                    Spacer()
                    Image("trash")
                        .resizable().frame(width: 45, height: 45)
                        .clipShape(Circle()).padding(.trailing, 50)
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
