//
//  QustionView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    @State var questionNum: Double = 1.0
    @State var selectedQuestion: Int = 1
    var body: some View {
        VStack(alignment: .center) {
            QuestionNavBarView(scoreIdx: scoreIdx)
            SliderView(questionNum: $questionNum, selectedQuestion: $selectedQuestion, questionCnt: quiz.scores[scoreIdx].questionCnt)
            TabView(selection: $selectedQuestion) {
                ForEach(0..<quiz.scores[scoreIdx].questionCnt, id:\.self) { idx in
                    QuestionSubView(scoreIdx: scoreIdx, questionIdx: idx)
                        .environmentObject(quiz)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: selectedQuestion) {offset in
                questionNum = Double(offset) + 1.0
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        QuestionView(scoreIdx: 0)
            .environmentObject(quiz)
    }
}
