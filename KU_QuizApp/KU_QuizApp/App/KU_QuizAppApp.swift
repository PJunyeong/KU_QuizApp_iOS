//
//  KU_QuizAppApp.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

@main
struct KU_QuizAppApp: App {
    @StateObject var quiz: Quiz = Quiz()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(quiz)
                .onAppear(perform: quiz.load)
        }
    }
}
