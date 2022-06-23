//
//  QuestionDetailView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct QuestionDetailView: View {
    let question: Question
    @Binding var showInfo: Bool
    var body: some View {
        Text(showInfo && !question.questionDetail.isEmpty ? question.questionDetail : question.question)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 10)
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static let question = Question(choice1: "보기1", choice1Detail: "보기 설명", choice2: "보기2", choice2Detail: "보기 설명", choice3: "보기3", choice3Detail: "보기 설명", choice4: "보기4", choice4Detail: "보기 설명", number: 1, order: 0, question: "문제 디테일 설명", questionDetail: "디테일 설명", testNum: 10, type: 1, answer: 1)
    static var previews: some View {
        QuestionDetailView(question: question, showInfo: .constant(false))
    }
}
