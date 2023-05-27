//
//  MultiplicationView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct MultiplicationView: View {
    //MARK: Storing property
    
    //Value to multiply
    @State var firstValue = Int.random(in: 1...30)
    @State var secondValue = Int.random(in: 1...30)
    
    //Hold input
    @State var input = ""
    
    //user answer has checked?
    @State var answerChecked = false
    
    //user answer is correct?
    @State var answerCorrect = false
    
    //MARK: Computing property
    
    //Correct answer
    var correctResponse: Int{
        return firstValue * secondValue
    }
    
    var body: some View {
        ZStack{
            //animation
            if answerCorrect == true {
                 LottieView(animationNamed: "32585-fireworks-display")
            }
            VStack (spacing: 0){

                // 1. Present question
                PresentQuestionView(sign: Operation.multiplication.rawValue,firstValue: firstValue, secondValue: secondValue)
                
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
                
                //3. Check Answer
                //    Only show button when answer has not already been checked
                if answerChecked == false {
                    
                    CheckAnswerButtonView(input: input,
                                          correctResponse: correctResponse,
                                          answerChecked: $answerChecked,
                                          answerCorrect: $answerCorrect)

                } else {
                    
                    // 4. Generate new question
                    // Only show this once an answer has been provided
                    Button(action: {
                        generateNewQuestion()
                    }, label: {
                        Text("New question")
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
        
            
        }
        
    
    //MARK: Function
    func generateNewQuestion() {
        
        // Generate a new question
        firstValue = Int.random(in: 1...30)
        secondValue = Int.random(in: 1...30)

        // Reset properties that track what's happening with the current question
        answerChecked = false
        answerCorrect = false
        
        // Reset the input field
        input = ""

    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
