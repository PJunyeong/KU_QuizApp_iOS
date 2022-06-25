//
//  ScoreView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var quiz: Quiz
    @State var testScoreOrderSelected: Int = 3
    @State var typeScoreOrderSelected: Int = 3
    @State private var isTest: Bool = true
    
    var body: some View {
        VStack {
            SegmentedPickerView(pickerName: "ScoreViewPicker", tag1: "기출별", tag2: "유형별", isTag1: $isTest)
            if isTest {
                ScoreListView(orderSelected: $testScoreOrderSelected, orderRange: [3, 4, 5], isTest: true)
                    .environmentObject(quiz)
            } else {
                ScoreListView(orderSelected: $typeScoreOrderSelected, orderRange: [3, 4, 5], isTest: false)
                    .environmentObject(quiz)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        ScoreView()
            .environmentObject(quiz)
    }
}
