//
//  OrderImage.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import Foundation

func OrderString(orderSelected: Int) -> String {
    if orderSelected == 0 {
        return "많이 틀린 순서"
    } else if orderSelected == 1 {
        return "회차별"
    } else {
        return "유형별"
    }
}
