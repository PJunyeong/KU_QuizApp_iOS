//
//  MainView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var quiz: Quiz
    init() {
    UITabBar.appearance().backgroundColor = UIColor.white
    }
    @State var tabSelected = Tab.first
    var body: some View {
        NavigationView{
            TabView(selection: $tabSelected){
                TestView()
                    .environmentObject(quiz)
                    .tabItem({Image(systemName: "square.and.pencil")
                        Text(Tab.first.title)})
                    .tag(Tab.first)
                NoteView()
                    .environmentObject(quiz)
                    .tabItem({Image(systemName: "newspaper")
                        Text(Tab.second.title)})
                    .tag(Tab.second)
                ScoreView()
                    .environmentObject(quiz)
                    .tabItem({Image(systemName: "chart.line.uptrend.xyaxis")
                        Text(Tab.third.title)})
                    .tag(Tab.third)
            }
            .tint(Color.accentColor)
            .navigationTitle(tabSelected.title)
            .navigationBarTitleDisplayMode(.large)
            .font(.largeTitle)
            // TODO; 모달 뷰 dismiss 시 네비게이션 Large TItle 업데이트가 늦음
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let quiz: Quiz = Quiz()
    static var previews: some View {
        MainView()
            .environmentObject(quiz)
    }
}
