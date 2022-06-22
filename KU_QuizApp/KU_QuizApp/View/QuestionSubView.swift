//
//  QuestionSubView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct QuestionSubView: View {
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    let questionIdx: Int
    @State var showInfo: Bool = false
    var body: some View {
        VStack {
            let question = quiz.fetchQuestion(testNum: quiz.scores[scoreIdx].testNum, scoreIdx: scoreIdx, questionIdx: questionIdx)
            HStack {
                Spacer()
                QuestionDescriptView(testNum: question.testNum, number: question.number, questionDescript: quiz.questionDescript(type: question.type), isTest: quiz.scores[scoreIdx].isTest)
                Spacer()
            }
            InfoLabelView(testNum: question.testNum, questionNum: question.number, showInfo: $showInfo)
            ScrollView {
                QuestionDetailView(question: question, showInfo: $showInfo)
                QuestionBoxView(questionBox: quiz.fetchQuestionBox(testNum: question.testNum, order: question.order))
                    .opacity(question.type == 6 ? 1 : 0)
                ChoiceListView(question: question, showInfo: $showInfo)
            }
            SelectChoiceView(scoreIdx: scoreIdx, questionIdx: questionIdx, selectedNum: quiz.scores[scoreIdx].answers[questionIdx])
                .environmentObject(quiz)
        }
    }
}

struct QuestionSubView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        QuestionSubView(scoreIdx: 0, questionIdx: 50)
            .environmentObject(quiz)
    }
}
