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
    @State var listID = 1
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
                            .onDelete {
                                noteDelete(at: $0, in: section)
                            }
                        } header: {
                            Text(HeaderName(orderSelected: orderSelected, Header: section))
                        }
                    }
                }
                .id(orderSelected)
                .listStyle(.sidebar)
            } else {
                List {
                    ForEach(quiz.bookmarkSections(orderSelected: orderSelected), id:\.self) { section in
                        Section {
                            ForEach(quiz.bookmarkSection(orderSelected: orderSelected, section: section)) { bookmark in
                                BookmarkLabelView(bookmark: bookmark, orderSelected: orderSelected)
                            }
                            .onDelete {
                                bookmarkDelete(at: $0, in: section)
                            }
                        } header: {
                            Text(HeaderName(orderSelected: orderSelected, Header: section))
                        }
                    }
                }
                .id(orderSelected)
                .listStyle(.sidebar)
            }
        }
    }
    func noteDelete(at offset: IndexSet, in section: Int) {
        withAnimation {
            let idx = offset[offset.startIndex]
            let note = quiz.noteSection(orderSelected: orderSelected, section: section)[idx]
            quiz.notes.removeAll(where: {$0.id == note.id})
        }
    }
    func bookmarkDelete(at offset: IndexSet, in section: Int) {
        withAnimation {
            let idx = offset[offset.startIndex]
            let bookmark = quiz.bookmarkSection(orderSelected: orderSelected, section: section)[idx]
            quiz.bookmarks.removeAll(where: {$0.id == bookmark.id})
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
