//
//  TestLabel.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct TestLabelView: View {
    @Environment(\.colorScheme) var colorScheme
    let testLabelName: String
    var body: some View {
        let color = colorScheme == .dark ? Color.black : Color.white
        HStack(alignment: .firstTextBaseline){
            Image(systemName: "pencil")
                .scaledToFit()
                .font(.system(.largeTitle, design: .rounded))
            Text(testLabelName)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
        }
        .frame(alignment: .center)
        .padding()
        .padding(.horizontal, 20)
        .foregroundColor(color)
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
