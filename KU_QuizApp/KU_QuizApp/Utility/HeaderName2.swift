//
//  HeaderName2.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import Foundation

func HeaderName2(key: String, value: Int) -> String {
    if key == "month" {
        return "\(value) 달 전"
    } else if key == "week" {
        return "\(value) 주 전"
    } else if key == "day" {
        if value == 1 {
            return "어제"
        } else if value == 2 {
            return "이틀 전"
        } else if value == 3 {
            return "사흘 전"
        } else {
            return "\(value)일 전"
        }
    } else {
        if value == 0 {
            return "방금 전"
        } else if value <= 6 {
            return "\(value) 시간 전"
        } else {
            return "오늘"
        }
    }
}
