//
//  TestView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var quiz: Quiz
    @State private var isTest: Bool = true
    var body: some View {
        VStack {
            SegmentedPickerView(pickerName: "TestViewPicker", tag1: "기출별 문제", tag2: "유형별 문제", isTag1: $isTest)
            TestListView(isTest: $isTest)
                .environmentObject(quiz)
            Spacer()
            Button(action: {
                quiz.scoreReset()
            }, label: {
                Text("RESET SCORE")
            })
            Button(action: {
                quiz.resetBookmark()
            }, label: {
                Text("RESET BOOKMARK")
            })
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static let quiz: Quiz = Quiz()
    static var previews: some View {
        TestView()
            .environmentObject(quiz)
    }
}
