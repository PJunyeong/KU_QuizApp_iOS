//
//  Note.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation

struct Note: Identifiable, Codable {
    let id = UUID()
    let testNum: Int
    let number: Int
    let type: Int
    var wrongCnt: Int = 1
}
