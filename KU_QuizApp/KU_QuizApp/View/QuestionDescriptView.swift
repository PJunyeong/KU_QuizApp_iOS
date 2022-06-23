//
//  QuestionTitleView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct QuestionDescriptView: View {
    let testNum: Int
    let number: Int
    let questionDescript: String
    let isTest: Bool
    var body: some View {
        VStack(alignment: .center) {
            if !isTest {
                Text("제 \(testNum)회 기출 \(number)번")
            }
            Text(questionDescript)
                .fontWeight(.bold)
        }
        .padding(.bottom, 10)
        .font(.title3)
        .foregroundColor(.gray)
    }
}

struct QuestionDescriptView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDescriptView(testNum: 10, number: 1, questionDescript: "유형 설명", isTest: false)
    }
}
