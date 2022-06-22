//
//  ContentView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var quiz: Quiz
    var body: some View {
        Text(quiz.questions[0].question)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let quiz: Quiz = Quiz()
    static var previews: some View {
        ContentView()
            .environmentObject(quiz)
    }
}
