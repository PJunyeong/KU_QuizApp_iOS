//
//  ScoreLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct ScoreLabelView: View {
    let score: Score
    var body: some View {
        HStack {
            Text("score -> 정보 추출 ")
        }
    }
}

struct ScoreLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreLabelView(score: Score(date: Date(), isTest: true, testNum: 10, type: nil, questionCnt: 100))
    }
}
