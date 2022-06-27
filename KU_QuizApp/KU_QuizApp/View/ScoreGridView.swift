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
    @Binding var scoreSelected: Int
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                let answers = quiz.scores[scoreIdx].selectedAnswers(scoreSelected: scoreSelected)
                ForEach(answers, id:\.self) { idx in
                    Button(action: {
                        let newIdx = answers.firstIndex(of: idx) ?? 0
                        sliderTabIdx = SliderTabIdx(questionNum: Double(newIdx + 1), selectedQuestion: newIdx)
                    }, label: {
                        ScoreGridLabelView(isRight: quiz.scores[scoreIdx].isRight(questionNum:idx), number: idx + 1)
                    })
                    .sheet(item: $sliderTabIdx) { stIdx in
                        AnswerView(scoreIdx: scoreIdx,
                                   isScoreChecked: true,
                                   questionNum: stIdx.questionNum, selectedQuestion: stIdx.selectedQuestion, scoreSelected: $scoreSelected)
                    }
                    }
                }
            }
            .animation(.easeOut, value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
            .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ScoreGridView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        let scoreIdx = 0
        ScoreGridView(scoreIdx: scoreIdx, scoreSelected: .constant(0))
            .environmentObject(quiz)
    }
}
