//
//  ChoiceListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct ChoiceListView: View {
    @EnvironmentObject var quiz: Quiz
    let question: Question
    let scoreIdx: Int
    let questionIdx: Int
    let isAnswerShown: Bool
    @State var selectedNum: Int = 0
    @Binding var showInfo: Bool
    var body: some View {
        let choices = question.choice3.isEmpty && question.choice4.isEmpty ? [Choice(choiceNum: 1, choice: question.choice1, choiceDetail: question.choice1Detail), Choice(choiceNum: 2, choice: question.choice2, choiceDetail: question.choice2Detail)] : [Choice(choiceNum: 1, choice: question.choice1, choiceDetail: question.choice1Detail), Choice(choiceNum: 2, choice: question.choice2, choiceDetail: question.choice2Detail), Choice(choiceNum: 3, choice: question.choice3, choiceDetail: question.choice3Detail), Choice(choiceNum: 4, choice: question.choice4, choiceDetail: question.choice4Detail)]
        ForEach(choices) { choice in
            ChoiceLabelView(choiceInfo: choice, answer: question.answer, scoreIdx: scoreIdx, questionIdx: questionIdx, isAnswerShown: isAnswerShown, selectedNum: $selectedNum, showInfo: $showInfo)
                .environmentObject(quiz)
        }
        Text("")
        // 마지막 번호 이후 패딩 효과
    }
}

struct ChoiceListView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static let scoreIdx = 0
    static let questionIdx = 1
    static let question = Question(choice1: "보기1", choice1Detail: "보기 설명", choice2: "보기2", choice2Detail: "보기 설명", choice3: "보기3", choice3Detail: "보기 설명", choice4: "보기4", choice4Detail: "보기 설명", number: 1, order: 0, question: "문제 디테일 설명", questionDetail: "디테일 설명", testNum: 10, type: 1, answer: 1)
    static var previews: some View {
        ChoiceListView(question: question, scoreIdx: scoreIdx, questionIdx: questionIdx, isAnswerShown: false, showInfo: .constant(false))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .environmentObject(quiz)
    }
}
