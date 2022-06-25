//
//  ScoreLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct ScoreLabelView: View {
    let score: Score
    let orderSelected: Int
    var body: some View {
        HStack {
            if orderSelected == 3 {
                Text("\(score.submittedScore) / \(score.questionCnt) 점")
                Text("\(score.questionTitle)")
            } else {
                Text("\(score.questionTitle)")
                Text("\(score.date)")
            }
        }
    }
}

struct ScoreLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreLabelView(score: Score(date: Date(), isTest: true, testNum: 10, type: nil, questionCnt: 100), orderSelected: 4)
    }
}
