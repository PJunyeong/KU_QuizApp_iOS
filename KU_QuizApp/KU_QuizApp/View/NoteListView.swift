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
            SelectOrderView(orderRange: orderRange, orderSelected: $orderSelected)
            if isNote {
                List {
                    ForEach(quiz.noteSections(orderSelected: orderSelected), id:\.self) { section in
                        Section {
                            ForEach(quiz.noteSection(orderSelected: orderSelected, section: section)) { note in
                                NoteLabelView(note: note, orderSelected: orderSelected)
                            }
                            .onDelete(perform: noteDelete)
                        } header: {
                            Text(NoteHeader(orderSelected: orderSelected, Header: section))
                        }
                    }
                }
                .listStyle(.sidebar)
            } else {
                List {
                    ForEach(quiz.bookmarkSections(orderSelected: orderSelected), id:\.self) { section in
                        Section {
                            ForEach(quiz.bookmarkSection(orderSelected: orderSelected, section: section)) { bookmark in
                                BookmarkLabelView(bookmark: bookmark, orderSelected: orderSelected)
                            }
                            .onDelete(perform: bookmarkDelete)
                        } header: {
                            Text(NoteHeader(orderSelected: orderSelected, Header: section))
                        }
                    }
                }
                .listStyle(.sidebar)
            }
        }
    }
    func noteDelete(offset: IndexSet) {
        withAnimation {
            quiz.notes.remove(atOffsets: offset)
        }
    }
    func bookmarkDelete(offset: IndexSet) {
        withAnimation {
            quiz.bookmarks.remove(atOffsets: offset)
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
