//
//  ScoreListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct ScoreListView: View {
    @EnvironmentObject var quiz: Quiz
    @State var orderSelected: Int
    let orderRange: [Int]
    let isTest: Bool
    var body: some View {
        VStack {
            SelectOrderView(orderRange: orderRange, orderSelected: $orderSelected)
            List {
                ForEach(quiz.scoreSections(orderSelected: orderSelected, isTest: isTest) as! [Int], id:\.self) { section in
                    Section {
                        ForEach(quiz.scoreSection(orderSelected: orderSelected, isTest: isTest, section: section)) { score in
                            ScoreLabelView(score: score, orderSelected: orderSelected)
                        }
                        .onDelete {
                            scoreDelete(at: $0, in: section)
                        }
                    } header: {
                        Text(HeaderName(orderSelected: orderSelected, Header: section))
                    }
                }
            }
            .listStyle(.sidebar)
        }
    }
    func scoreDelete(at offset: IndexSet, in section: Int) {
        withAnimation {
            let idx = offset[offset.startIndex]
            let score = quiz.scoreSection(orderSelected: orderSelected, isTest: isTest, section: section)[idx]
            quiz.scores.removeAll(where: {$0.id == score.id})
        }
    }
}

struct ScoreListView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        ScoreListView(orderSelected: 4, orderRange: [3, 4, 5], isTest: true)
            .environmentObject(quiz)
    }
}
