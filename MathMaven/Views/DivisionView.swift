//
//  DivisionView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct DivisionView: View {
    //MARK: Storing property
    
    //Value to multiply
    @State var secondValue = Int.random(in: 1...10)
    @State var correctAnswer = Int.random(in: 1...10)
    
    //Hold input
    @State var input = ""
    
    //user answer has checked?
    @State var answerChecked = false
    
    //user answer is correct?
    @State var answerCorrect = false
    
    //MARK: Computing property
    
    //Correct answer
    var firstValue: Int{
        return secondValue * correctAnswer
    }
    var body: some View {
        
        VStack(spacing: 0){
            //1. Present question
            PresentQuestionView(sign: Operation.division.rawValue, firstValue: firstValue, secondValue: secondValue)
            
            //2. Accept answer
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
        }
        .font(Font.custom("SF Pro", size: 64))
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
}
