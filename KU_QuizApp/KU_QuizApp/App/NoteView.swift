//
//  NoteView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var quiz: Quiz
    @State private var isNote: Bool = true
    // 노트: 0: 많이 틀린 순서 1: 기출 회차별 2: 유형별 정렬
    // 북마크: 0: 기출 회차별 1: 유형별 정렬
    var body: some View {
        VStack {
            SegmentedPickerView(pickerName: "NoteViewPicker", tag1: "오답", tag2: "북마크", isTag1: $isNote)
            if isNote {
                NoteListView(isNote: true)
                    .environmentObject(quiz)
            } else {
                NoteListView(isNote: false)
                    .environmentObject(quiz)
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
