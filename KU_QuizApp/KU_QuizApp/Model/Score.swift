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
        if questions == nil {
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
            guard let questions = questions else {
                return total
            }
            
            for idx in 0..<questionCnt {
                if questions[idx].answer == answers[idx] {
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
        self.answers = Array(repeating: 0, count: questionCnt)
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
            guard let testNum = testNum else {
                return "제 10회 한자 기출 시험"
            }
            return "제 \(testNum)회 한자 기출 시험"
        } else {
            guard let type = type else {
                return "한자 유형 1번 기출 시험"
            }
            return "한자 유형 \(type)번 기출 시험"
        }
    }
    
    mutating func setAnswer(questionIdx: Int, answer: Int) -> Void {
        guard questionIdx < questionCnt else {
            return
        }
        
        self.answers[questionIdx] = answer        
    }
    
    var scoreCnt: String {
        guard isSubmitted else {
            return ""
        }
        
        return "\(submittedScore) / \(questionCnt)"
    }
    
    var scoreMessage: String {
        guard isSubmitted else {
            return ""
        }
        
        let percent = Double(submittedScore) / Double(questionCnt) * 100.0
        
        if isTest {
            // 기출별 문제
            if percent >= 90.0 {
                return "1급 합격입니다! 미리 합격 축하드립니다"
            } else if percent >= 80.0 {
                return "2급 합격입니다! 문제 없이 안정권이군요!"
            } else if percent >= 60.0 {
                return "3급 합격입니다!"
            } else if percent >= 50.0 {
                return "불합격입니다! 조금만 더 노력해볼까요?"
            } else if percent >= 40.0 {
                return "불합격입니다! 오답노트로 공부해보세요!"
            } else {
                return "불합격입니다! 모르는 문제는 북마크로 표시해보세요!"
            }
        } else {
            // 유형별 문제
            guard let type = type else {
                return "유형별 문제"
            }
            if percent >= 90.0 {
                return "명실상부 \(type)번 유형의 고수입니다!"
            } else if percent >= 80.0 {
                return "거의 \(type)번 유형을 마스터하셨군요!"
            } else if percent >= 60.0 {
                return "\(type)번 유형에 익숙해지셨군요!"
            } else if percent >= 50.0 {
                return "\(type)번 유형에 한 번 더 도전해보시겠어요?"
            } else if percent >= 40.0 {
                return "\(type)번 유형 관련 오답노트를 살펴보세요!"
            } else {
                return "\(type)번 유형으로 북마크를 채워보세요!"
            }
        }
    }
}
