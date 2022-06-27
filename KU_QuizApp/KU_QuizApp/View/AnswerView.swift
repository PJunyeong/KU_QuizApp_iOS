//
//  AnswerView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    @State var questionNum: Double
    @State var selectedQuestion: Int
    @Binding var scoreSelected: Int
    var body: some View {
        VStack(alignment: .center) {
            let questionCnt = quiz.scores[scoreIdx].selectedAnswers(scoreSelected: scoreSelected).count
            if questionCnt > 1 {
                SliderView(questionNum: $questionNum, selectedQuestion: $selectedQuestion, questionCnt: questionCnt)
                // 주어진 조건에 따른 문제만 슬라이딩/탭으로 보여주기
            }
            TabView(selection: $selectedQuestion) {
                ForEach(0..<questionCnt, id:\.self) { idx in
                    let question = quiz.fetchQuestion(testNum: quiz.scores[scoreIdx].testNum, scoreIdx: scoreIdx, questionIdx: idx)
                    AnswerSubView(testNum: question.testNum, number: question.number, answer: quiz.scores[scoreIdx].answers[idx])
                        .tag(idx)
                        .environmentObject(quiz)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: selectedQuestion) {offset in
                questionNum = Double(offset) + 1.0
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        AnswerView(scoreIdx: 0, questionNum: 1.0, selectedQuestion: 0, scoreSelected: .constant(1))
            .environmentObject(quiz)
    }
}
