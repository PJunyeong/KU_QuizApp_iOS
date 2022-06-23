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
            let validAnswerCnt = question.choice3.isEmpty && question.choice4.isEmpty ? 3 : 5
            ForEach(1..<validAnswerCnt, id:\.self) { choiceNum in
                Button(action: {
                    selectedNum = selectedNum == choiceNum ? 0 : choiceNum
                    quiz.scores[scoreIdx].setAnswer(questionIdx: questionIdx, answer: selectedNum)
                }, label: {
                    Image(systemName: NumberImage2(choiceNum: choiceNum, selectedNum: selectedNum))
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 80)
                        .padding(.horizontal, 2)
                })
                .opacity(choiceNum < validAnswerCnt ? 1 : 0)
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
