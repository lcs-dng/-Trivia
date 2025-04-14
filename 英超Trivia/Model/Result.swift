//
//  Result.swift
//  英超Trivia
//
//  Created by Dexter Ng on 2025-04-10.
//

import Foundation

struct Result: Identifiable {
    
    let id = UUID()
    
    // The player the user is supposed to guess
    let player: Player
    
    // What the user actually guessed
    let guessProvided: String
    
    // What aspect of the player was the user guessing
    let aspect: String
    
    // Whether the user is correct or not
    let outcome: Outcome
    
}
