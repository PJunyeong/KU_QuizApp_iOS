//
//  ScoreGridLabelView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/26.
//

import SwiftUI

struct ScoreGridLabelView: View {
    let isRight: Bool
    let number: Int
    var body: some View {
        Text("\(number)")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(isRight ? .green : .red)
    }
}

struct ScoreGridLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreGridLabelView(isRight: false, number: 100)
            .previewLayout(.sizeThatFits)
    }
}
