//
//  ScoreDetailView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct ScoreDetailView: View {
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ScoreDetailView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        ScoreDetailView(scoreIdx: 0)
            .environmentObject(quiz)
    }
}
