//
//  TestListView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct TestListView: View {
    @EnvironmentObject var quiz: Quiz
    let testNums: [Int] = [10, 20, 30, 40, 50]
    let typeNums: [Int] = [1, 2, 3, 4, 5, 6]
    let questionCnts: [Int] = [10, 25, 50]
    @State private var questionCnt: Int = 10
    @State private var testNum: Int = 10
    @State private var type: Int = 1
    @State private var isTestClicekd: Bool? = false
    @State private var isConfirmationShown: Bool = false
    @State private var isConfirmationClicked: Bool? = false
    @State private var scoreIdx: Int = 0
    @Binding var isTest: Bool
    var body: some View {
        if isTest {
            NavigationLink(destination: QuestionView(scoreIdx: scoreIdx), tag: true, selection: $isTestClicekd) {
                EmptyView()
            }
                        
            ForEach(testNums, id:\.self) { testNum in
                Button(action: {
                    self.testNum = testNum
                    scoreIdx = quiz.scoreIdxCached(isTest: true, testNum: testNum, type: nil, questionCnt: 100)
                    isTestClicekd = true
                    
                }, label: {
                    TestLabelView(testLabelName: "기출 \(testNum)회")
                })
            }
        } else {
            
            NavigationLink(destination: QuestionView(scoreIdx: scoreIdx), tag: true, selection: $isConfirmationClicked) {
                EmptyView()
            }
            
            ForEach(typeNums, id:\.self) { typeNum in
                TestLabelView(testLabelName: "유형 0\(typeNum)회")
                    .onTapGesture {
                        type = typeNum
                        isConfirmationShown.toggle()
                    }
                    .confirmationDialog(
                        "유형별 문제 개수를 선택하세요",
                        isPresented: $isConfirmationShown,
                        titleVisibility: .visible
                    ) {
                        ForEach(questionCnts, id:\.self) { qCnt in
                            Button(action: {
                                withAnimation {
                                    questionCnt = qCnt
                                    scoreIdx = quiz.scoreIdxCached(isTest: false, testNum: nil, type: typeNum, questionCnt: qCnt)
                                    isConfirmationClicked = true
                                }
                            }, label: {
                                Text("\(qCnt)개 풀기")
                                    .tint(.accentColor)
                            })
                        }
                        Button("다시 생각해볼게요", role: .cancel) {
                            withAnimation {
                                isConfirmationShown = false
                            }
                        }
                    }
            }
        }
    }
}

struct TestListView_Previews: PreviewProvider {
    static let quiz: Quiz = Quiz()
    static var previews: some View {
        TestListView(isTest: .constant(false))
            .environmentObject(quiz)
    }
}
