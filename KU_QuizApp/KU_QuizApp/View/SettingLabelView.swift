//
//  SettingLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct SettingLabelView: View {
    let labelString: String
    let labelImage: String
    var body: some View {
        HStack {
            Text(labelString)
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
        .font(.system(.headline, design: .rounded))
    }
}

struct SettingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        let labelString = "어플리케이션"
        let labelImage = "apps.iphone"
        SettingLabelView(labelString: labelString, labelImage: labelImage)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
