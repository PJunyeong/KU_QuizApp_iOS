//
//  ScoreOrderString.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import Foundation

func ScoreOrderString(scoreSelected: Int) -> String {
    if scoreSelected == 0 {
        return "모든 문제"
    } else if scoreSelected == 1 {
        return "틀린 문제"
    } else {
        return "맞힌 문제"
    }
}
