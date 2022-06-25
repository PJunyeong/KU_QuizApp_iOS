//
//  NoteOrderView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct NoteOrderView: View {
    @State var isOrderShown: Bool = false
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
                "오답 정렬 기준을 선택하세요",
                isPresented: $isOrderShown,
                titleVisibility: .visible
            ) {
                ForEach(0..<3, id:\.self) { order in
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

struct NoteOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NoteOrderView(orderSelected: .constant(1))
    }
}
