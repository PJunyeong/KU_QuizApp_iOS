//
//  NumberImage2.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import Foundation

func NumberImage(choiceNum: Int, selectedNum: Int) -> String {
    if choiceNum == selectedNum {
        return "\(choiceNum).circle.fill"
    } else {
        return "\(choiceNum).circle"
    }
}
