//
//  Player.swift
//  Futsal Shuffle
//
//  Created by Justin Armstrong on 12/15/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import Foundation

class Player:ObservableObject {
    // Default score is 0
    @Published var playerScore:Int = 0
    
    // 0 for playerhand should give us an unusable number
    @Published var playerHand:Int = 0
}
