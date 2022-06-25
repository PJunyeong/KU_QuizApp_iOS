//
//  ResetName.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import Foundation

func ResetName(reset: Int) -> String {
    if reset == 0 {
        return "오답노트 초기화"
    } else if reset == 1 {
        return "북마크 초기화"
    } else {
        return "점수 초기화"
    }
}
