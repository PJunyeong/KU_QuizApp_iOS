//
//  Score.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation

struct Score: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let isTest: Bool
    var isSubmitted: Bool = false
    let testNum: Int?
    let type: Int?
    let questionCnt: Int
    var questions: [Question]? = nil
    var answers: [Int] = []
    
    mutating func setQuestions(questions: [Question]) -> Void {
        guard questions.count == questionCnt else {
            return
        }        
        self.questions = questions
    }
    
    mutating func setAnswers() -> Void {
        self.answers = Array(repeating: 0, count: questionCnt + 1)
        // answer 개수 -> 문제 수 조정
    }
    
    var isAllChecked: Bool {
        return answers.filter{$0 != 0}.count == questionCnt
    }
    
    var questionTitle: String {
        if isTest {
            return "제 \(testNum!)회 한자 기출 시험"
        } else {
            return "\(type!)회 한자 유형별 기출 시험"
        }
    }
    
    mutating func setAnswer(questionIdx: Int, answer: Int) -> Void {
        guard questionIdx < questionCnt else {
            return
        }
        
        self.answers[questionIdx] = answer        
    }
    
}
