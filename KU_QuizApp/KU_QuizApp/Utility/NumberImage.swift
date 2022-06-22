//
//  NumberImage.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import Foundation

func NumberImage(choiceNum: Int, showInfo: Bool) -> String {
    if showInfo {
        return "\(choiceNum).circle.fill"
    } else {
        return "\(choiceNum).circle"
    }
}
