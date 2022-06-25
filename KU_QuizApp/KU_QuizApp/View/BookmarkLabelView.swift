//
//  BookmarkLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct BookmarkLabelView: View {
    let bookmark: Bookmark
    var body: some View {
        HStack {
            Text("기출 \(bookmark.testNum)회")
            Text("유형 \(bookmark.type)")
            Text("\(bookmark.number)번")
        }
    }
}

struct BookmarkLabelView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkLabelView(bookmark: Bookmark(testNum: 10, number: 1, type: 1))
    }
}
