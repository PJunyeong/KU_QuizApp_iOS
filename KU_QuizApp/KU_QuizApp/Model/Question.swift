//
//  Question.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation

struct Question: Identifiable, Codable, Hashable {
    let id = UUID()
    let choice1: String
    let choice1Detail: String
    let choice2: String
    let choice2Detail: String
    let choice3: String
    let choice3Detail: String
    let choice4: String
    let choice4Detail: String
    let number: Int
    let order: Int
    let question: String
    let questionDetail: String
    let testNum: Int
    let type: Int
    let answer: Int
}
