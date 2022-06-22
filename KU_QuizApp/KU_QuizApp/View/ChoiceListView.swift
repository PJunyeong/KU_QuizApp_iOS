//
//  ChoiceListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct ChoiceListView: View {
    let question: Question
    @Binding var showInfo: Bool
    var body: some View {
        let choices = question.choice3.isEmpty && question.choice4.isEmpty ? [Choice(choiceNum: 1, choice: question.choice1, choiceDetail: question.choice1Detail), Choice(choiceNum: 2, choice: question.choice2, choiceDetail: question.choice2Detail)] : [Choice(choiceNum: 1, choice: question.choice1, choiceDetail: question.choice1Detail), Choice(choiceNum: 2, choice: question.choice2, choiceDetail: question.choice2Detail), Choice(choiceNum: 3, choice: question.choice3, choiceDetail: question.choice3Detail), Choice(choiceNum: 4, choice: question.choice4, choiceDetail: question.choice4Detail)]
        ForEach(choices) { choice in
            ChoiceLabelView(choiceInfo: choice, answer: question.answer, showInfo: $showInfo)
        }
    }
}

struct ChoiceListView_Previews: PreviewProvider {
    static let question = Question(choice1: "보기1", choice1Detail: "보기 설명", choice2: "보기2", choice2Detail: "보기 설명", choice3: "보기3", choice3Detail: "보기 설명", choice4: "보기4", choice4Detail: "보기 설명", number: 1, order: 0, question: "문제 디테일 설명", questionDetail: "디테일 설명", testNum: 10, type: 1, answer: 1)
    static var previews: some View {
        ChoiceListView(question: question, showInfo: .constant(false))
    }
}
