//
//  NoteOrderView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct SelectOrderView: View {
    @State var isOrderShown: Bool = false
    let orderRange: [Int]
    @Binding var orderSelected: Int
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isOrderShown.toggle()
            }, label: {
                Text(OrderString(orderSelected:orderSelected))
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
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
    static var previews: some View {
        SelectOrderView(orderRange: [1, 2], orderSelected: .constant(1))
    }
}
