//
//  SettingRowView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct SettingRowView: View {
    let name: String
    let content: String?
    let linkLabel: String?
    let linkDestination: String?
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 5)
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(name: "출처", content: nil, linkLabel: "고려대학교 한자한문연구소", linkDestination: "https://kuhjhm.korea.ac.kr/hjhm/exam/past_q.do")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
