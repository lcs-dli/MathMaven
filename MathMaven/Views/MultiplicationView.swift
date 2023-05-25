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
    var correctAnswer: Int{
        return firstValue * secondValue
    }
    
    var body: some View {
        VStack {
            Text("Multiplication")
            Text(Operation.multiplication.rawValue)
        }
        .font(Font.custom("SF Pro", size: 64))
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
