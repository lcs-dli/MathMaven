//
//  PresentQuestionView.swift
//  MathMaven
//
//  Created by David Li on 2023-05-25.
//

import SwiftUI

struct PresentQuestionView: View {
    
    //MARK: Storing property
    let sign: String
    let firstValue: Int
    let secondValue: Int
    
    //MARK: Computing property
    var body: some View {
        Group{
            HStack {
                Text(sign)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(firstValue)")
                    Text("\(secondValue)")
                }
            }
            Divider()
        }
        .padding(.horizontal)
        
    }
}

