//
//  SettingView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("isTimerOn") var isTimerOn: Bool = UserDefaults.standard.bool(forKey: "isTimerOn")
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // 1: 앱 소개
                    GroupBox(label:
                                SettingLabelView(labelString: "한자 기출 풀이", labelImage: "info.circle")
                             )
                    {
                        Divider()
                        HStack(alignment: .center, spacing: 10) {
                            Image("appstore")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                            Spacer()
                            Text("고려대학교 졸업 한자 기출 풀이를 위한 어플리케이션입니다. 기출별, 유형별 문제 선택 및 오답노트, 북마크, 점수 확인을 할 수 있습니다.")
                                .multilineTextAlignment(.center)
                                .font(.footnote)
                        }
                        .font(.title)
                        
                    }
                    // 2: 앱 정보
                    GroupBox(label:
                                SettingLabelView(labelString: "앱 정보", labelImage: "apps.iphone")
                    ) {
                        SettingRowView(name: "개발자", content: "Junyeong Park", linkLabel: nil, linkDestination: nil)
                        SettingRowView(name: "이메일", content: "j_aion@naver.com", linkLabel: nil, linkDestination: nil)
                        SettingRowView(name: "언어", content: "Swift", linkLabel: nil, linkDestination: nil)
                        // TODO: 개발 언어 표시 방법 체크
                        SettingRowView(name: "버전", content: "1.0", linkLabel: nil, linkDestination: nil)

                    }
                    // 3: 저작권 정보
                    GroupBox(label:
                                SettingLabelView(labelString: "저작권 정보", labelImage: "link.circle")
                    ) {
                        SettingRowView(name: "문제 출처", content: nil, linkLabel: "고려대학교 한자한문연구소", linkDestination: "https://kuhjhm.korea.ac.kr/hjhm/exam/past_q.do")
                    }
                    
                    // 4: Timer 설정
                    GroupBox(label:
                                SettingLabelView(labelString: "타이머", labelImage: "timer")
                    ) {
                        Toggle(isOn: $isTimerOn) {
                            if isTimerOn {
                                Text("힌트 타이머 ON".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("힌트 타이머 OFF".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }.padding()
                            .background(
                                Color(UIColor.tertiarySystemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            )
                    }
                }
                .navigationTitle("설정")
                .navigationBarTitleDisplayMode(.large)
                .padding()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
