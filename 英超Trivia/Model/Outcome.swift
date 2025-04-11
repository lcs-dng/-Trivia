//
//  Outcome.swift
//  英超Trivia
//
//  Created by Dexter Ng on 2025-04-11.
//

import Foundation

// Track the state of the given guess
enum Outcome: String {
    case undetermined = ""
    case correct = "✅"
    case incorrect = "❌"
}
