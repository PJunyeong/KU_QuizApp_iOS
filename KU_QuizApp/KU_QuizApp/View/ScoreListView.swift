//
//  ScoreListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct ScoreListView: View {
    @EnvironmentObject var quiz: Quiz
    @State var orderSelected: Int
    let orderRange: [Int]
    let isTest: Bool
    var body: some View {
        VStack {
            SelectOrderView(orderRange: orderRange, orderSelected: $orderSelected)
        }
    }
}

struct ScoreListView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        ScoreListView(orderSelected: 1, orderRange: [3, 4, 5], isTest: true)
            .environmentObject(quiz)
    }
}
