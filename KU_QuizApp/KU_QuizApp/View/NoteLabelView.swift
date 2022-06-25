//
//  NoteLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/24.
//

import SwiftUI

struct NoteLabelView: View {
    let note: Note
    let orderSelected: Int
    var body: some View {
        HStack {
            if orderSelected == 0 {
                Text("기출 \(note.testNum)회")
                Text("유형 \(note.type)")
                Text("\(note.number)번")
            } else if orderSelected == 1 {
                Text("유형 \(note.type)")
                Text("\(note.number)번")
                Text("\(note.wrongCnt)회 오답")
            } else {
                Text("기출 \(note.testNum)회")
                Text("\(note.number)번")
                Text("\(note.wrongCnt)회 오답")
            }
        }
    }
}

struct NoteLabelView_Previews: PreviewProvider {
    static var previews: some View {
        NoteLabelView(note: Note(testNum: 10, number: 10, type: 1), orderSelected: 0)
    }
}
