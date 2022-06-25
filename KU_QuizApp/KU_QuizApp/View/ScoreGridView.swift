//
//  ScoreGridView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct ScoreGridView: View {
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    @State private var isAnimating: Bool = false
    @State private var sliderTabIdx: SliderTabIdx? = nil
    @Binding var scoreSelected: Bool
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(0..<quiz.scores[scoreIdx].questionCnt, id:\.self) { idx in
                    let question = quiz.fetchQuestion(testNum: quiz.scores[scoreIdx].testNum, scoreIdx: scoreIdx, questionIdx: idx)
                    if (scoreSelected && quiz.scores[scoreIdx].answers[idx] != question.answer) || !scoreSelected {
                        // 틀린 문제, 모든 문제 해당 문제 표시
                        Button(action: {
                            sliderTabIdx = SliderTabIdx(questionNum: Double(idx + 1), selectedQuestion: idx)
                        }, label: {
                            Text("\(idx + 1)")
                                .foregroundColor(.black)
                        })
                        .sheet(item: $sliderTabIdx) { stIdx in
                            AnswerView(scoreIdx: scoreIdx, questionNum: stIdx.questionNum, selectedQuestion: stIdx.selectedQuestion)
                        }
                    }
                }
            }
            .animation(.easeOut, value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ScoreGridView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        let scoreIdx = 0
        ScoreGridView(scoreIdx: scoreIdx, scoreSelected: .constant(false))
            .environmentObject(quiz)
    }
}
