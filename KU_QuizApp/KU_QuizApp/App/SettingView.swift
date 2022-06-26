//
//  SettingView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct SettingView: View {
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
                            Image(systemName: "gamecontroller")
                            // TODO: 앱 로고로 변경
                            Spacer()
                            Text("한자 기출 풀이를 위한 어플리케이션입니다. 기출별, 유형별 문제 선택 및 오답노트, 북마크, 점수 확인을 할 수 있습니다.")
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
                        SettingRowView(name: "호환성", content: "iOS 14", linkLabel: nil, linkDestination: nil)
                        // TODO: 앱 출시 경우 호환성 테스트 어떻게 하는지 체크
                        SettingRowView(name: "언어", content: "SwiftUI 3.0", linkLabel: nil, linkDestination: nil)
                        // TODO: 개발 언어 표시 방법 체크
                        SettingRowView(name: "버전", content: "1.0", linkLabel: nil, linkDestination: nil)

                    }
                    // 3: 저작권 정보
                    GroupBox(label:
                                SettingLabelView(labelString: "저작권 정보", labelImage: "link.circle")
                    ) {
                        SettingRowView(name: "문제 출처", content: nil, linkLabel: "한자한문연구소", linkDestination: "https://kuhjhm.korea.ac.kr/hjhm/exam/past_q.do")
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
