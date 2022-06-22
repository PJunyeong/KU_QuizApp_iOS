//
//  TestLabel.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct TestLabelView: View {
    let testLabelName: String
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Image(systemName: "pencil")
            Text(testLabelName)
        }
        .frame(alignment: .center)
        .font(.largeTitle)
        .padding()
        .padding(.horizontal, 20)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .clipShape(Capsule())
    }
}

struct TestLabelView_Previews: PreviewProvider {
    static var previews: some View {
        TestLabelView(testLabelName: "10회")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
