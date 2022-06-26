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
            Button(action: {
                showBackAlert.toggle()
            }, label: {
                Image(systemName: "chevron.left")
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
        .padding(.top, 20)
        .background(Color(UIColor.systemBackground))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
        .alert("문제를 그만 푸시겠습니까?", isPresented: $showBackAlert, actions: {
            Button("네. 그만 풀겠습니다", role: .destructive) {
                dismiss()
            }
            Button("아니오", role: .cancel) {
            }
        }, message: {
            Text("지금까지 푼 기록이 저장됩니다")
        })
        .alert(Text(quiz.scores[scoreIdx].isAllChecked ? "모든 문제를 풀었습니다. 제출하시겠습니까?" : "아직 풀지 않은 문제가 있습니다"), isPresented: $showSubmitAlert) {
            Button("네. 제출하겠습니다", role: .destructive) {
                quiz.scores[scoreIdx].submit()
                quiz.setnotes(scoreIdx: scoreIdx)
                isSubmitted.toggle()
            }
            Button("아니오", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $isSubmitted, content: {
            ScoreDetailView(scoreIdx: scoreIdx).environmentObject(quiz)
        })
    }}

struct QuestionNavBarView_Previews: PreviewProvider {
    static let quiz = Quiz()
    static var previews: some View {
        QuestionNavBarView(scoreIdx: 0)
            .environmentObject(quiz)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
