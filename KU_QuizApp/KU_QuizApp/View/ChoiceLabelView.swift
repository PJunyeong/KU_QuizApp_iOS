//
//  ChoiceLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct ChoiceLabelView: View {
    let choiceInfo: Choice
    let answer: Int
    @Binding var showInfo: Bool
    var body: some View {
        HStack {
            Image(systemName: NumberImage(choiceNum: choiceInfo.choiceNum, showInfo: showInfo))
                .font(.largeTitle)
                .foregroundColor(showInfo && answer == choiceInfo.choiceNum ? Color.accentColor : Color.primary)
                .padding(.leading, 40)
            Spacer()
            Text(showInfo ? choiceInfo.choiceDetail : choiceInfo.choice)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct ChoiceLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceLabelView(choiceInfo: Choice(choiceNum: 1, choice: "보기1", choiceDetail: "보기 해설"), answer: 1, showInfo: .constant(false))
    }
}
