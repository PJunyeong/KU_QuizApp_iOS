//
//  OrderImage.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import Foundation

func OrderString(orderSelected: Int) -> String {
    if orderSelected == 0 {
        return "오답 횟수별"
    } else if orderSelected == 1 {
        return "기출별"
    } else if orderSelected == 2 {
        return "유형별"
    } else if orderSelected == 3 {
        return "최신순"
    } else if orderSelected == 4 {
        return "낮은 점수순"
    } else if orderSelected == 5 {
        return "높은 점수순"
    } else {
        return "디폴트"
    }
}
