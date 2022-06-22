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
        VStack {
            HStack {
                Spacer()
                Text("제 \(testNum)회 기출")
                Text("\(number)번")
                Spacer()
            }
            .font(.title)
            .opacity(isTest ? 0 : 1)
            Text(questionDescript)
                .font(.title)
                .fontWeight(.bold)
        }
        .foregroundColor(.gray)
    }
}

struct QuestionDescriptView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDescriptView(testNum: 10, number: 1, questionDescript: "유형 설명", isTest: false)
    }
}
