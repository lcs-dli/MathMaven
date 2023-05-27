//
//  CalculationView.swift
//  MathMaven
//
//  Created by David Li on 2023-05-25.
//

import SwiftUI

struct CalculationView: View {
    //MARK: Storing property

    //Type of View
    let typeView = Operation.addition
    
    // The numbers to be added
    @State var firstValue = Int.random(in: 1...72)
    @State var secondValue = Int.random(in: 1...72)
    
    // Holds whatever input was provided by the user
    @State var input = ""
    
    // Has the user's answer been checked?
    @State var answerChecked = false
    
    // Was the user's given answer correct?
    @State var answerCorrect = false
    
    //MARK: Computing property
    
    //find the correct answer base on its type of operation
    var correctAnswer: Int{
        switch typeView{
            //Addition
            case .addition:
                return firstValue + secondValue
            
            //Subtraction
            case .subtraction:
                return firstValue - secondValue
            
            //Multiplication
            case .multiplication:
                return firstValue * secondValue
            
            //Division
            case .division:
                return firstValue / secondValue
        }
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


