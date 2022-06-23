//
//  Score.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation
import SwiftUI

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
    
    var submittedScore: Int {
        if questions == nil && testNum != nil {
            let questions: [Question] = Bundle.main.decode("questions.json")
            let questionsFiltered = questions.filter{$0.testNum == testNum!}.sorted(by: {$0.number < $1.number})
            let rightAnswers = questionsFiltered.map{$0.answer}
            
            var total = 0
            guard rightAnswers.count == questionCnt else {
                return total
            }
            for idx in 0..<questionCnt {
                if rightAnswers[idx] == answers[idx] {
                    total += 1
                }
            }
            return total
        } else {
            var total = 0
            guard questions != nil else {
                return total
            }
            for idx in 0..<questionCnt {
                if questions![idx].answer == answers[idx] {
                    total += 1
                }
            }
            return total
        }
    }
    
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
    
    mutating func submit() -> Void {
        self.isSubmitted = true
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
