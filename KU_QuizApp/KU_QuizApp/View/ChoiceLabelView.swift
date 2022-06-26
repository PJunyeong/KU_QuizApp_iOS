//
//  ChoiceLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct ChoiceLabelView: View {
    @EnvironmentObject var quiz: Quiz
    let choiceInfo: Choice
    let answer: Int
    let scoreIdx: Int
    let questionIdx: Int
    let isAnswerShown: Bool
    @Binding var selectedNum: Int
    @Binding var showInfo: Bool
    var body: some View {
        HStack {
            Image(systemName: NumberImage(choiceNum: choiceInfo.choiceNum, selectedNum: selectedNum))
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .padding(.horizontal, 20)
            Spacer()
            Text(showInfo && !choiceInfo.choiceDetail.isEmpty ? choiceInfo.choiceDetail : choiceInfo.choice)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .contentShape(Rectangle())
        .background(showInfo && choiceInfo.choiceNum == answer ? .accentColor.opacity(0.5) : Color(UIColor.systemBackground))
        .onTapGesture {
            selectedNum = selectedNum == choiceInfo.choiceNum ? 0 : choiceInfo.choiceNum
            quiz.scores[scoreIdx].setAnswer(questionIdx: questionIdx, answer: selectedNum)
        }
        .disabled(isAnswerShown)
    }
}

struct ChoiceLabelView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static let choiceInfo = Choice(choiceNum: 1, choice: "보기", choiceDetail: "보기 해설")
    static let scoreIdx = 0
    static let questionIdx = 1
    static var previews: some View {
        ChoiceLabelView(choiceInfo: choiceInfo, answer: 1, scoreIdx: 0, questionIdx: 1, isAnswerShown: false, selectedNum: .constant(1), showInfo: .constant(false))
            .environmentObject(quiz)
    }
}
