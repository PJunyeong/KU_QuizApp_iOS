//
//  NoteListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/24.
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var quiz: Quiz
    @State var orderSelected: Int
    let orderRange: [Int]
    let isNote: Bool
    // isNote true -> 오답노트 / false -> 북마크 리스트
    var body: some View {
        VStack {
            NoteOrderView(orderRange: orderRange, orderSelected: $orderSelected)
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        NoteListView(orderSelected: 0, orderRange: [0, 1, 2], isNote: true)
            .environmentObject(quiz)
    }
}
