//
//  NoteListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/24.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var quiz: Quiz
    @State private var orderSelected: Int = 0
    let isNote: Bool
    // isNote true -> 오답노트 / false -> 북마크 리스트
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NoteListView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        NoteListView(isNote: true)
            .environmentObject(quiz)
    }
}
