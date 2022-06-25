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
                if orderSelected == 3 {
                    let dateSections = quiz.scoreDateSecions(isTest: isTest)
                    ForEach(Array(dateSections.keys), id:\.self) { key in
                        ForEach(dateSections[key] ?? [], id:\.self) { value in
                            Section {
                                ForEach(quiz.scoreDateSection(isTest: isTest, sectionDate: key, section: value)) { score in
                                    ScoreLabelView(score: score, orderSelected: orderSelected)
                                }
                                .onDelete {
                                    scoreDateDelete(at: $0, in: key, in: value)
                                }
                            } header: {
                                Text(HeaderName2(key: key, value: value))
                            }
                        }
                    }
                } else {
                    ForEach(quiz.scoreSections(orderSelected: orderSelected, isTest: isTest), id:\.self) { section in
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
            }
            .id(orderSelected)
            .listStyle(.sidebar)
        }
    }
    
    func scoreDateDelete(at offset: IndexSet, in key: String, in value: Int) {
        withAnimation {
            let idx = offset[offset.startIndex]
            let score = quiz.scoreDateSection(isTest: isTest, sectionDate: key, section: value)[idx]
            quiz.scores.removeAll(where: {$0.id == score.id})
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
        ScoreListView(orderSelected: 3, orderRange: [3, 4, 5], isTest: true)
            .environmentObject(quiz)
    }
}
