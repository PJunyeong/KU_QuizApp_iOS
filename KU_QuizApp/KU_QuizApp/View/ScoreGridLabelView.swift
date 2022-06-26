//
//  ScoreGridLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct ScoreGridLabelView: View {
    @Environment(\.colorScheme) var colorScheme
    let number: Int
    var body: some View {
        let color = colorScheme == .dark ? Color.white : Color.black
        Text("\(number)")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(color)
        // TODO: 정렬 조건 또는 정답/오답에 따른 색깔 여부 체크
    }
}

struct ScoreGridLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreGridLabelView(number: 100)
            .previewLayout(.sizeThatFits)
    }
}
