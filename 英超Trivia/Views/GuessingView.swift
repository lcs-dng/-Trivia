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
        
    // Aspect of the player to answer
    @State var selectedAspect: Aspect = .name
    
    // Check whether the answer is correct or not
    @State var isCorrect: Bool?
    
    // Is the "Answer" button pressed?
    @State var isAnswerSubmitted = false
    
    // MARK: Computed properties
    var body: some View {
        
        // Picker to select what aspect to answer
        Picker("Answering by", selection: $selectedAspect) {
            ForEach(Aspect.allCases) { aspect in
                Text(aspect.rawValue).tag(aspect)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
        VStack {
            
            ZStack {
                // The prompt image
                Image(currentPlayer.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                // Giving feedbacks to the user based on the outcome of the answer
                if let isCorrect = isCorrect {
                    let feedback = isCorrect ? "✅" : "❌"
                    
                    Text(feedback)
                        .font(.system(size: 20))
                        .background(Color.white)
                        .cornerRadius(5)
                }
            }
            
            HStack {
                TextField("Enter the answer", text: $userGuess)
                
                Button {
                    let correctAnswer = getCorrectAnswer(for: selectedAspect)
                    
                    isCorrect = userGuess.lowercased() == correctAnswer.lowercased()
                    
                    isAnswerSubmitted.toggle()
                } label: {
                    Text("Answer")
                }
                                
                Button {
                    resetGame()
                } label: {
                    if isAnswerSubmitted == true {
                        
                        // The button is called "Next" after the user answers
                        Text("Next")
                        
                    } else {
                        
                        // Called "Skip" otherwise
                        Text("Skip")
                        
                    }
                }

            }
            .padding()
            
        }
        .padding()
    }
        
    func resetGame() {
        
        // Next player appears
        currentPlayer = playerToGuess.randomElement()!
        
        // Reset the textfield
        userGuess = ""
        
        // Get rid of the feedback
        isCorrect = nil
        
        // Turn the "Next" button back to "Skip" when the button is pressed
        isAnswerSubmitted = false
        
    }
    
    func getCorrectAnswer(for aspect: Aspect) -> String {
        switch aspect {
            
        case .name:
            return currentPlayer.playerName
            
        case .club:
            return currentPlayer.currentClub
            
        case .position:
            return currentPlayer.position
            
        case .nationality:
            return currentPlayer.nationality
            
        }
    }
    
}

#Preview {
    GuessingView()
}
