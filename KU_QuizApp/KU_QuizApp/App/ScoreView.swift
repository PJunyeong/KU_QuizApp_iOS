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
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
