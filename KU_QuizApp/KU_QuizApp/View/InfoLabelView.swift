//
//  InfoLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct InfoLabelView: View {
    @EnvironmentObject var quiz: Quiz
    let testNum: Int
    let questionNum: Int
    let type: Int
    @State var isBookmarked: Bool
    @Binding var showInfo: Bool
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isBookmarked.toggle()
                quiz.toggleBookmark(testNum: testNum, number: questionNum, type: type)
            }, label: {
                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
            })
            Button(action: {
                showInfo.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {showInfo.toggle()})
            }, label: {
                Image(systemName: showInfo ? "info.circle.fill" : "info.circle")
            })
        }
        .font(.title)
        .padding(.horizontal, 20)
        .foregroundColor(.accentColor)
    }
}

struct InfoLabelView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        InfoLabelView(testNum: 10, questionNum: 1, type: 1, isBookmarked: true, showInfo: .constant(true))
            .environmentObject(quiz)
    }
}
