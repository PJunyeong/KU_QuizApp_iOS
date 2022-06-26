//
//  MainView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var quiz: Quiz
    @Environment(\.colorScheme) var colorScheme
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }
    @State private var settingSelected: Bool = false
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        settingSelected.toggle()
                    }, label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    })
                    .sheet(isPresented: $settingSelected, content: {
                        SettingView()
                    })
                })
            }
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
