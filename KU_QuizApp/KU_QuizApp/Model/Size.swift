//
//  Size.swift
//  KU_QuizApp
//
// Thanks to Seodam and Ken

import UIKit
//  사용 예시 :
//  Rectangle()
//      .frame(width: CustomSize.titleWidth, height: CustomSize.titleHeight)

enum CustomSize {
    // Device Screen Size
    static var fullWidth: CGFloat { UIScreen.main.bounds.width }
    static var fullHeight: CGFloat { UIScreen.main.bounds.height }
    
    static var questionFontSize: CGFloat {CustomSize.fullWidth * (100 / 844)}
    static var choiceIconWidth: CGFloat {CustomSize.fullWidth * (40 / 844)}
    static var questionDescriptFontSize: CGFloat {CustomSize.fullWidth * (30 / 844)}
    static var questionDetailFontSize: CGFloat {CustomSize.fullWidth * (40 / 844 )}
    
}
