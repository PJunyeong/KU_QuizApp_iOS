//
//  NoteHeader.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import Foundation

func NoteHeader(orderSelected: Int, Header: Int) -> String {
    if orderSelected == 0 {
        return "\(Header)회 오답"
    } else if orderSelected == 1 {
        return "\(Header)회 기출"
    } else {
        return "\(Header)번 유형"
    }
}
