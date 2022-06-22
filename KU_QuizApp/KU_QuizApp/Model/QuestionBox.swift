//
//  QuestionBox.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation

struct QuestionBox: Identifiable, Codable {
    let id = UUID()
    let testNum: Int
    let order: Int
    let box: String
}
