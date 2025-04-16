//
//  Filter.swift
//  英超Trivia
//
//  Created by Dexter Ng on 2025-04-14.
//

import Foundation

// Inputs (parameters)
//      - the original list
//      - the query that the user enters
//
// Outout:
//      - the filtered list
func searching(
    originalList: [Result],
    query: String,
) -> [Result] {
    
    // When the search text is empty, returns the original list
    if query.lowercased() == "" {
        
        return originalList
        
    } else {
        
        var filteredHistory: [Result] = []
        
        // For-in loop to check each player
        for result in originalList {
            
            // Check if the search text is in any of the player's aspects
            if result.guessProvided.lowercased().contains(query.lowercased()) ||
               result.aspect.lowercased().contains(query.lowercased()) {
                
                filteredHistory.append(result)
                
            }
            
        }
                
        return filteredHistory
        
    }
    
}
