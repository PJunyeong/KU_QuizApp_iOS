//
//  Items.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation

class Quiz: Identifiable, ObservableObject {
    let questions: [Question] = Bundle.main.decode("questions.json")
    let questionBox: [QuestionBox] = Bundle.main.decode("questionBox.json")
    // 문제 정보 -> JSON 파싱
    @Published var bookmarks: [Bookmark] = [Bookmark(testNum: 10, number: 1)] {
        didSet {
            bookmarkSave()
    ()
        }
    }
    @Published var notes: [Note] = [Note(testNum: 10, number: 1, type: 1)] {
        didSet {
            noteSave()
        }
    }
    @Published var scores: [Score] = [Score(date: Date(), isTest: true, isSubmitted: false, testNum: 10, type: nil, questionCnt: 100, questions: nil, answers: Array(repeating: 0, count: 101))] {
        didSet {
            scoreSave()
        }
    }
    // 사용자 기록 -> @Published 통해 지속 관리
    // Preview load를 위한 더미 데이터 -> 실제로는 빈 배열로 설정 후 세이브 데이터 로드하기
    
    func load() {
        bookmarkLoad()
        noteLoad()
        scoreLoad()
    }
    
    private func bookmarkLoad() {
        do {
            let url = DocumentDirectory().appendingPathComponent("bookmark")
            let data = try Data(contentsOf: url)
            let bookmarks = try JSONDecoder().decode([Bookmark].self, from: data)
            self.bookmarks = bookmarks
        } catch {
            print("bookmark load failed")
        }
    }
    
    private func bookmarkSave() {
        do {
            let data = try JSONEncoder().encode(bookmarks)
            let url = DocumentDirectory().appendingPathComponent("bookmark")
            try data.write(to: url)
        } catch {
            print("bookmark save failed")
        }
    }
    
    private func noteLoad() {
        do {
            let url = DocumentDirectory().appendingPathComponent("note")
            let data = try Data(contentsOf: url)
            let notes = try JSONDecoder().decode([Note].self, from: data)
            self.notes = notes
        } catch {
            print("note load failed")
        }
    }
    
    private func noteSave() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = DocumentDirectory().appendingPathComponent("note")
            try data.write(to: url)
        } catch {
            print("note save failed")
        }
    }
    
    private func scoreLoad() {
        do {
            let url = DocumentDirectory().appendingPathComponent("score")
            let data = try Data(contentsOf: url)
            let scores = try JSONDecoder().decode([Score].self, from: data)
            self.scores = scores
        } catch {
            print("score load failed")
        }
    }
    
    private func scoreSave() {
        do {
            let data = try JSONEncoder().encode(scores)
            let url = DocumentDirectory().appendingPathComponent("score")
            try data.write(to: url)
        } catch {
            print("score save failed")
        }
    }
    
    func isScoreCached(isTest: Bool, testNum: Int?, type: Int?, questionCnt: Int) -> Bool {
        let scoreFiltered = scores.filter{$0.isTest == isTest && $0.testNum == testNum && $0.type == type && $0.questionCnt == questionCnt && $0.isSubmitted == false}
        if scoreFiltered.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func scoreIdxCached(isTest: Bool, testNum: Int?, type: Int?, questionCnt: Int) -> Int {
        if isScoreCached(isTest: isTest, testNum: testNum, type: type, questionCnt: questionCnt) {
            for idx in 0..<scores.count {
                let curScore = scores[idx]
                if curScore.isTest == isTest && curScore.testNum == testNum && curScore.type == type && curScore.questionCnt == questionCnt && curScore.isSubmitted == false {
                    print("cached!")
                    print("\(idx) returned")
                    return idx
                }
            }
        } else {
            print("cached failed!")
            print("\(scores.count) returned")
            return setScoreIdx(isTest: isTest, testNum: testNum, type: type, questionCnt: questionCnt)
        }
        return -1
    }
    
    func scoreReset() -> Void {
        scores = []
    }
    
    func setScoreIdx(isTest: Bool, testNum: Int?, type: Int?, questionCnt: Int) -> Int {
        var score = Score(date: Date(), isTest: isTest, testNum: testNum, type: type, questionCnt: questionCnt)
        score.setAnswers()
        if !isTest && type != nil {
            let questions = randomQuestions(type: type!, questionCnt: questionCnt)
            score.setQuestions(questions: questions)
        }
        scores.append(score)
        print("SET SCORE IDX: \(scores.count-1)")
        return scores.count - 1
    }
    
    private func randomQuestions(type: Int, questionCnt: Int) -> [Question] {
        let questionsFiltered = questions.filter{$0.type == type}
        let questions = Array(Array(Set(questionsFiltered)).prefix(questionCnt))
        return questions
    }
    
    func questionDescript(type: Int) -> String {
        switch type {
        case 1: return "다음 한자의 독음이 바른 것은?"
        case 2: return "다음의 독음을 가진 것은?"
        case 3: return "다음 한자와 독음이 같은 것은?"
        case 4: return "다음 한자의 뜻이 바른 것은?"
        case 5: return "다음의 뜻을 가진 것은?"
        case 6: return "다음 글을 읽고 물음에 답하시오."
        default: return "한자 기출 시험"
        }
    }
    
    func isBookmarked(testNum: Int, number: Int) -> Bool {
        if bookmarks.filter({$0.testNum == testNum && $0.number == number}).isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func toggleBookmark(testNum: Int, number: Int) -> Void {
        if isBookmarked(testNum: testNum, number: number) {
            removeBookmark(testNum: testNum, number: number)
        } else {
            setBookmark(testNum: testNum, number: number)
        }
    }
    
    func setBookmark(testNum: Int, number: Int) -> Void {
        if !isBookmarked(testNum: testNum, number: number) {
            let bookmark = Bookmark(testNum: testNum, number: number)
            bookmarks.append(bookmark)
        }
    }
    
    func removeBookmark(testNum: Int, number: Int) -> Void {
        if isBookmarked(testNum: testNum, number: number) {
            for idx in 0..<bookmarks.count {
                let bookmark = bookmarks[idx]
                if bookmark.testNum == testNum && bookmark.number == number {
                    bookmarks.remove(at: idx)
                    return
                }
            }
        }
    }
    
    func fetchQuestions(testNum: Int?, scoreIdx: Int) -> [Question] {
        if testNum == nil {
            if scores[scoreIdx].questions != nil {
                return scores[scoreIdx].questions!.sorted(by: {$0.number < $1.number})
            }
        } else {
            return questions.filter{$0.testNum == testNum}.sorted(by: {$0.number < $1.number})
        }
        return []
    }
    
    func fetchQuestion(testNum: Int?, scoreIdx: Int, questionIdx: Int) -> Question {
        let questions = fetchQuestions(testNum: testNum, scoreIdx: scoreIdx)
        return questions[questionIdx]
    }
    
    func fetchQuestionBox(testNum: Int, order: Int) -> String {
        let questionBox = questionBox.filter{$0.testNum == testNum && $0.order == order}
        if questionBox.isEmpty {
            return ""
        } else {
            return questionBox[0].box
        }
    }
}
