//
//  ScoreView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var quiz: Quiz
    @State private var isTest: Bool = true
    
    var body: some View {
        VStack {
            SegmentedPickerView(pickerName: "ScoreViewPicker", tag1: "기출별", tag2: "유형별", isTag1: $isTest)
            ScoreListView(orderSelected: 3, orderRange: [3, 4, 5], isTest: isTest)
                .environmentObject(quiz)
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
