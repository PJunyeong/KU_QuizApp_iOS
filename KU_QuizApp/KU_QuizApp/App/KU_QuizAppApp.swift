//
//  KU_QuizAppApp.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

@main
struct KU_QuizAppApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @StateObject var quiz: Quiz = Quiz()
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                MainView()
                    .environmentObject(quiz)
                    .onAppear(perform: quiz.load)
            }
        }
    }
}
