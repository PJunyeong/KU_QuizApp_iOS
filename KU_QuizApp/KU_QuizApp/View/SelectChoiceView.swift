//
//  SelectChoiceView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct SelectChoiceView: View {
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    let questionIdx: Int
    @State var selectedNum: Int = 0
    var body: some View {
        HStack {
            Spacer()
            let question = quiz.fetchQuestion(testNum: quiz.scores[scoreIdx].testNum, scoreIdx: scoreIdx, questionIdx: questionIdx)
            let validAnswerCnt = question.choice3.isEmpty && question.choice4.isEmpty ? 4 : 5
            let startNum = validAnswerCnt == 4 ? 0 : 1
            ForEach(startNum..<validAnswerCnt, id:\.self) { choiceNum in
                Button(action: {
                    selectedNum = selectedNum == choiceNum ? 0 : choiceNum
                    quiz.scores[scoreIdx].setAnswer(questionIdx: questionIdx, answer: selectedNum)
                }, label: {
                    Image(systemName: NumberImage2(choiceNum: choiceNum, selectedNum: selectedNum))
                        .resizable()
                        .scaledToFit()
                })
                .opacity((validAnswerCnt == 4 && (choiceNum == 1 || choiceNum == 2) || validAnswerCnt == 5) ? 1: 0)
                // 보기 4개 / 보기 2개 따라서 같은 이미지 크기 및 중앙 정렬
                // TODO: 이미지 크기 프레임이 아니라 다른 방식으로 구현하기
            }
            Spacer()
        }
    }
}

struct SelectChoiceView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        SelectChoiceView(scoreIdx: 0, questionIdx: 50)
            .environmentObject(quiz)
            .previewLayout(.sizeThatFits)
    }
}
