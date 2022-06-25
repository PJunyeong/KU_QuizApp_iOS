//
//  ScoreSelectOrderView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct ScoreSelectOrderView: View {
    @State private var isOrderShown: Bool = false
    @Binding var scoreSelected: Bool
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isOrderShown.toggle()
            }, label: {
                Text(scoreSelected ? "틀린 문제" : "모든 문제")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
            })
            .confirmationDialog(
                "확인할 문제를 선택하세요",
                isPresented: $isOrderShown,
                titleVisibility: .visible
            ) {
                Button(action: {
                    withAnimation {
                        scoreSelected = false
                    }
                }, label: {
                    Text("모든 문제 확인")
                })
                Button(action: {
                    withAnimation {
                        scoreSelected = true
                    }
                }, label: {
                    Text("틀린 문제 보기")
                })
                Button("다시 생각해볼게요", role: .cancel) {
                    withAnimation {
                        isOrderShown = false
                    }
                }
            }
        }
    }
}

struct ScoreSelectOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSelectOrderView(scoreSelected: .constant(true))
    }
}
