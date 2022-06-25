//
//  NoteHeader.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import Foundation

func HeaderName(orderSelected: Int, Header: Int) -> String {
    if orderSelected == 0 {
        return "\(Header)회 오답"
    } else if orderSelected == 1 {
        return "\(Header)회 기출"
    } else if orderSelected == 2 {
        return "\(Header)번 유형"
    } else if orderSelected == 3 {
        return "\(Header) 날"
    } else {
        return "\(Header) 점"
    }
}
