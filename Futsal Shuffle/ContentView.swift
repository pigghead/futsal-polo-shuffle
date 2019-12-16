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
    @State private var drawnCard:Int?
    
    var body: some View {
        List {
//            ForEach (self.newDeck.deck, id:\.self) { card in
//                Text(card.description)
//            }
            Button(action: {
                self.drawnCard = self.newDeck.popCard()
            }) {
                Text(drawnCard?.description ?? "Draw!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
