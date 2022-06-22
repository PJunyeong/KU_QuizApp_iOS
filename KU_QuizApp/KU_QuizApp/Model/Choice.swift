//
//  Choice.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import Foundation

struct Choice: Identifiable {
    let id = UUID()
    let choiceNum: Int
    let choice: String
    let choiceDetail: String
}
