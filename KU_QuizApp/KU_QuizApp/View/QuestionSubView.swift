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
            InfoLabelView(testNum: question.testNum, questionNum: question.number, type: question.type, isBookmarked: quiz.isBookmarked(testNum: question.testNum, number: question.number, type: question.type),showInfo: $showInfo)
            ScrollView(showsIndicators: false) {
                QuestionDescriptView(testNum: question.testNum, number: question.number, questionDescript: quiz.questionDescript(type: question.type), isTest: quiz.scores[scoreIdx].isTest)
                QuestionDetailView(question: question, showInfo: $showInfo)
                QuestionBoxView(questionBox: quiz.fetchQuestionBox(testNum: question.testNum, order: question.order))
                    .opacity(question.type == 6 ? 1 : 0)
                ChoiceListView(question: question, scoreIdx: scoreIdx, questionIdx: questionIdx, isAnswerShown: false, selectedNum: quiz.scores[scoreIdx].answers[questionIdx], showInfo: $showInfo)
                    .environmentObject(quiz)
            }
        }
    }
}

struct QuestionSubView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        QuestionSubView(scoreIdx: 0, questionIdx: 50)
            .environmentObject(quiz)
            .preferredColorScheme(.dark)
    }
}
