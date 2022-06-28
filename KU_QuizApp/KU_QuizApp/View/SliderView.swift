//
//  SliderView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct SliderView: View {
    @Binding var questionNum: Double
    @State private var isEditing: Bool = false
    @Binding var selectedQuestion: Int
    let questionCnt: Int
    var body: some View {
        //TODO: 슬라이더 뷰 패딩 최소화
        HStack(alignment: .center, spacing: .leastNormalMagnitude) {
            Slider(value: $questionNum, in: 1...Double(questionCnt), step: 1) {
                Text("Speed")
            } minimumValueLabel: {
                Text("")
            } maximumValueLabel: {
                Text("")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            .onChange(of: questionNum, perform: { offset in
                selectedQuestion = Int(offset) - 1
            })
            Text("\(Int(questionNum)) / \(Int(questionCnt))")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)

    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(questionNum: .constant(1.0), selectedQuestion: .constant(1), questionCnt: 10)
    }
}
