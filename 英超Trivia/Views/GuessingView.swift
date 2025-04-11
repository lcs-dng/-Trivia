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
        
    // What was the outcome of the given guess?
    @State var currentOutcome: Outcome = .undetermined
    
    // Is the "Answer" button pressed?
    @State var isAnswerSubmitted = false
    
    // The list of previous guesses
    @State var history: [Result] = [] // empty array
    
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
        
        HStack {
            
            VStack {
                
                ZStack {
                    // The prompt image
                    Image(currentPlayer.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 300, height: 300)
                    
                        
                    Text(currentOutcome.rawValue)
                        .font(.system(size: 20))
                        .background(Color.white)
                        .cornerRadius(5)
                }
                
                HStack {
                    TextField("Enter the answer", text: $userGuess)
                    
                    Button {
                        checkGuess()
                        
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
            
            VStack {
                
                List(history) { currentResult in
                    
                    HStack {
                        
                        Image(currentResult.player.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                        
                        Text(currentResult.guessProvided)
                        
                        Text("(\(currentResult.aspect))")
                        
                        Spacer()
                        
                        Text(currentResult.outcome)
                        
                    }
                    
                }
                
            }
            
        }
            
    }
        
    // MARK: Functions
    func checkGuess() {
        
        let correctAnswer = getCorrectAnswer(for: selectedAspect)
        
        if userGuess.lowercased() == correctAnswer.lowercased() {
            currentOutcome = .correct
            print("Correct")
        } else {
            currentOutcome = .incorrect
            print("Incorrect")
        }
        
    }
    
    func resetGame() {
                
        if currentOutcome != .undetermined {
            // Save answers in [history]
            history.insert(
                Result(
                    player: currentPlayer,
                    guessProvided: userGuess,
                    aspect: selectedAspect.rawValue,
                    outcome: currentOutcome.rawValue
                ),
                at: 0
            )
        }
        
        // Next player appears
        currentPlayer = playerToGuess.randomElement()!
        
        // Reset the textfield
        userGuess = ""
        
        // Get rid of the feedback
        currentOutcome = .undetermined

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
