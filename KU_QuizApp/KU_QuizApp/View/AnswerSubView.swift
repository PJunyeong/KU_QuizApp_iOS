//
//  AnswerView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct AnswerSubView: View {
    @EnvironmentObject var quiz: Quiz
    let testNum: Int
    let number: Int
    @State var showInfo: Bool = false
    var body: some View {
        VStack {
            let question = quiz.questions.filter{$0.testNum == testNum && $0.number == number}[0]
            InfoLabelView(testNum: question.testNum, questionNum: question.number, type: question.type, isBookmarked: quiz.isBookmarked(testNum: question.testNum, number: question.number, type: question.type),showInfo: $showInfo)
            ScrollView(showsIndicators: false) {
                QuestionDescriptView(testNum: question.testNum, number: question.number, questionDescript: quiz.questionDescript(type: question.type), isTest: false)
                QuestionDetailView(question: question, showInfo: $showInfo)
                QuestionBoxView(questionBox: quiz.fetchQuestionBox(testNum: question.testNum, order: question.order))
                    .opacity(question.type == 6 ? 1 : 0)
                ChoiceListView(question: question, scoreIdx: 0, questionIdx: 0, isAnswerShown: true, selectedNum: 0, showInfo: $showInfo)
                    .environmentObject(quiz)
            }
        }
    }
}

struct AnswerSubView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        AnswerSubView(testNum: 10, number: 1)
            .environmentObject(quiz)
    }
}
