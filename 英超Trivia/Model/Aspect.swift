//
//  Aspect.swift
//  英超Trivia
//
//  Created by Dexter Ng on 2025-04-08.
//

import Foundation

enum Aspect: String, CaseIterable, Identifiable {
    
    case name = "Name"
    case club = "Club"
    case position = "Position"
    case nationality = "Nationality"
    
    var id: String {self.rawValue}
}
