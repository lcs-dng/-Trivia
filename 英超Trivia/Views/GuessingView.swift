//
//  ContentView.swift
//  英超Trivia
//
//  Created by Dexter Ng on 2025-04-03.
//

import SwiftUI

struct GuessingView: View {
    
    // MARK: Stored properties
    
    // What the user is supposed to be guessing
    @State var currentPlayer = playerToGuess.randomElement()!
        
    // What the user enter for answer
    @State var userGuess = ""
    
    // Feedback for the user's answer
    @State var feedback: String = ""
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            ZStack {
                Image(currentPlayer.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text(feedback)
                    .font(.system(size: 20))
                    .background(Color.white)
                    .cornerRadius(5)
            }
            
            HStack {
                TextField("Enter the answer", text: $userGuess)
                
                Button {
                    checkGuess()
                } label: {
                    Text("Answer")
                }
            }
            
        }
        .padding()
    }
    
    func checkGuess() {
        
        if userGuess == currentPlayer.playerName {
            feedback = "✅"
        } else if userGuess != currentPlayer.playerName {
            feedback = "❌"
        }
        
    }
    
}

#Preview {
    GuessingView()
}
