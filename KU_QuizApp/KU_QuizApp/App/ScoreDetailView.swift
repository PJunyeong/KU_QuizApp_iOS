//
//  ScoreDetailView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct ScoreDetailView: View {
    @EnvironmentObject var quiz: Quiz
    @State var scoreSelected: Bool = false
    let scoreIdx: Int
    var body: some View {
        VStack {
            ScoreNavBarView(questionTitle: quiz.scores[scoreIdx].questionTitle)
            Text(quiz.scores[scoreIdx].scoreCnt)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
                .padding()
            Text(quiz.scores[scoreIdx].scoreMessage)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            ScoreSelectOrderView(scoreSelected: $scoreSelected)
            ScoreGridView(scoreIdx: scoreIdx, scoreSelected: $scoreSelected)
                .environmentObject(quiz)
                .padding(.bottom, 20)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ScoreDetailView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        ScoreDetailView(scoreIdx: 0)
            .environmentObject(quiz)
    }
}
