//
//  QuestionNavBarView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct QuestionNavBarView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var quiz: Quiz
    let scoreIdx: Int
    @State private var isAnimated: Bool = false
    @State private var showBackAlert: Bool = false
    @State private var showSubmitAlert: Bool = false
    @State private var isSubmitted: Bool = false
    
    var body: some View {
        HStack {
//            NavigationLink(destination: ScoreDetailView(scoreIdx: scoreIdx).environmentObject(quiz), tag: true, selection: $isSubmitted) {
//                EmptyView()
//            }
            
            Button(action: {
                showBackAlert.toggle()
            }, label: {
                Image(systemName: "delete.backward")
                    .font(.headline)
            })
            Spacer()
            Text(quiz.scores[scoreIdx].questionTitle)
                .font(.headline)
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            Spacer()
            Button(action: {
                showSubmitAlert.toggle()
            }, label: {
                Text("제출")
                    .font(.headline)
                    .fontWeight(.bold)
            })
        }
        .padding(.horizontal, 15)
        .padding(.bottom)
        .padding(.top, SafeAreaTop())
        .background(.white)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
        .alert("경고!", isPresented: $showBackAlert) {
            Button(action: {
                dismiss()
//                NavigationUtil.popToRootView()
            }, label: {
                Text("그만 둘래요!")
            })
            Button("계속 풀게요!", role: .cancel) {}
        }
        .alert(Text(quiz.scores[scoreIdx].isAllChecked ? "모두 풀었어요!" : "안 푼 문제가 있어요!"), isPresented: $showSubmitAlert) {
            Button(action: {
                quiz.scores[scoreIdx].submit()
                isSubmitted.toggle()
            }, label: {
                Text("제출할게요!")
            })
            Button("계속 풀게요!", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $isSubmitted, content: {
            ScoreDetailView(scoreIdx: scoreIdx).environmentObject(quiz)
        })
    }
}

struct QuestionNavBarView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        QuestionNavBarView(scoreIdx: 0)
            .environmentObject(quiz)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
