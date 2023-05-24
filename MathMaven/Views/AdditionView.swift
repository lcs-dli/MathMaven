//
//  AdditionView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // The numbers to be added
    @State var augend = Int.random(in: 1...72)
    @State var addend = Int.random(in: 1...72)
    
    // Holds whatever input was provided by the user
    @State var input = ""
    
    // Has the user's answer been checked?
    @State var answerChecked = false
    
    // Was the user's given answer correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties

    // The correct response
    var correctResponse: Int {
        return augend + addend
    }
    
    // The user interface to show
    var body: some View {
        
        VStack(spacing: 0) {
            
            // 1. Present question
            Group {
                HStack {
                    Text(Operation.addition.rawValue)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(augend)")
                        Text("\(addend)")
                    }
                }
                
                Divider()
            }
            .padding(.horizontal)

            // 2. Accept answer
            HStack {

                ZStack {
                    
                    // Only show this when the answer was found to be correct
                    if answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                    
                    // Show this when the answer was checked and found to be false
                    if answerChecked == true && answerCorrect == false {
                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                TextField("",
                          text: $input)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)

            // 3. Check answer
            //    Only show button when answer has not already been checked
            if answerChecked == false {
                Button(action: {
                    checkAnswer()
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                .padding()
                .buttonStyle(.bordered)
            }
            
            // Push interface up to top of screen
            Spacer()

        }
        .font(Font.custom("SF Pro", size: 64))
    }
    
    // MARK: Functions
    func checkAnswer() {
        
        // Can the user's input be converted to an integer?
        guard let providedAnswer = Int(input) else {
            
            // Input could not be
            answerCorrect = false
            
            // Record that the user's answer has been checked
            answerChecked = true

            // End the function, nothing more to do
            return
        }
        
        // Check the provided answer
        if providedAnswer == correctResponse {
            // Celebrate! User's provided answer was correct👍🏼
            answerCorrect = true
        } else {
            // An integer was provided, but it's not correct 😭
            answerCorrect = false
        }
        
        // Record that the user's answer has been checked
        answerChecked = true

    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
