//
//  SegmentedPickerView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

struct SegmentedPickerView: View {
    let pickerName: String
    let tag1: String
    let tag2: String
    @Binding var isTag1: Bool
    
    var body: some View {
        Picker(pickerName, selection: $isTag1) {
            Text(tag1)
                .font(isTag1 ? .title : .title2)
                .fontWeight(isTag1 ? .bold : .semibold)
                .tag(true)
            Text(tag2)
                .font(isTag1 ? .title2 : .title)
                .fontWeight(isTag1 ? .semibold : .bold)
                .tag(false)
        }
        .pickerStyle(SegmentedPickerStyle())
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .onTapGesture{
            isTag1.toggle()
        }
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static let pickerName = "PickerName"
    static let tag1 = "tag1"
    static let tag2 = "tag2"
    static var previews: some View {
        SegmentedPickerView(pickerName: pickerName, tag1: tag1, tag2: tag2, isTag1: .constant(true))
    }
}
