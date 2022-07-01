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
        HStack(alignment: .center) {
            Image(systemName: NumberImage(choiceNum: choiceInfo.choiceNum, selectedNum: selectedNum))
                .font(.title)
                .foregroundColor(!isAnswerShown ? .accentColor : selectedNum != choiceInfo.choiceNum ? .accentColor : selectedNum == answer ? .green : .red)
                .padding(.trailing, 10)
                .padding(.leading, 20)
            // TODO: 전체 보기의 텍스트 박스 길이 리턴 -> 가장 큰 값 기준으로 가운데 정렬하기
//                .padding(.leading, CustomSize.choiceIconWidth)
            Text(showInfo && !choiceInfo.choiceDetail.isEmpty ? choiceInfo.choiceDetail : choiceInfo.choice)
                .font(.title)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .contentShape(Rectangle())
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.gray.opacity(0.2), lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 10).fill(showInfo && choiceInfo.choiceNum == answer ? Color.accentColor.opacity(0.5) : .clear))
                    .padding(.horizontal, 10)
            )
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
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
