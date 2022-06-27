//
//  NoteOrderView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct SelectOrderView: View {
    @EnvironmentObject var quiz: Quiz
    @State var isOrderShown: Bool = false
    let reset: Int
    let orderRange: [Int]
    @Binding var orderSelected: Int
    var body: some View {
        HStack {
            Button(action: {
                if reset == 0 {
                    quiz.resetNote()
                } else if reset == 1 {
                    quiz.resetBookmark()
                } else {
                    quiz.resetScore()
                }
            }, label: {
                Text(ResetName(reset:reset))
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
            })
            Spacer()
            Button(action: {
                isOrderShown.toggle()
            }, label: {
                HStack {
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.headline)
                    Text(OrderString(orderSelected:orderSelected))
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.trailing, 20)
                }
            })
            .confirmationDialog(
                "정렬 기준을 선택하세요",
                isPresented: $isOrderShown,
                titleVisibility: .visible
            ) {
                ForEach(orderRange, id:\.self) { order in
                    Button(action: {
                        withAnimation {
                            orderSelected = order
                        }
                    }, label: {
                        Text(OrderString(orderSelected: order))
                    })
                }
                Button("다시 생각해볼게요", role: .cancel) {
                    withAnimation {
                        isOrderShown = false
                    }
                }
            }
        }
    }
}

struct SelectOrderView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        SelectOrderView(reset: 0, orderRange: [1, 2], orderSelected: .constant(1))
            .environmentObject(quiz)
    }
}
