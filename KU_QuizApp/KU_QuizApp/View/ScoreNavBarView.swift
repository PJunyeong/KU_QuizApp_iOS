//
//  ScoreNavBarView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/25.
//

import SwiftUI

struct ScoreNavBarView: View {
    let questionTitle: String
    @State private var isAnimated: Bool = false
    var body: some View {
        HStack {
            Button(action: {
                popToRootView()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.headline)
            })
            Spacer()
            Text(questionTitle + " 채점 결과")
                .font(.headline)
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.bottom)
        .padding(.top, SafeAreaTop())
        .padding(.top, 20)
        .background(.white)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

struct ScoreNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreNavBarView(questionTitle: "문제 유형 설명")
    }
}
