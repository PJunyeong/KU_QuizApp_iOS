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
    
    
    // SportsSelectionView: Portrait
    
    
    // ServeOrderSelectionView: Portrait
    static var selectServeOrderButtonWidth: CGFloat { CustomSize.fullWidth * (132 / 390) }
    static var selectServeOrderButtonHeight: CGFloat { CustomSize.fullHeight * (152 / 844) }
    static var selectServeOrderButtonImageWidth: CGFloat { selectServeOrderButtonWidth * 0.7 }
    static var selectServeOrderButtonImageHeight: CGFloat { selectServeOrderButtonHeight * 0.7 }
    
    // ReadyView: Landscape
    static var progressGaugeWidth: CGFloat { CustomSize.progressGaugeHeight }
    static var progressGaugeHeight: CGFloat { CustomSize.fullHeight * (170 / 390) }
    
    
    // ScoreView: Landscape
    static var scoreBoardWidth: CGFloat { CustomSize.fullWidth * (235 / 844) }
    static var scoreBoardHeight: CGFloat { CustomSize.fullHeight * (227 / 390) }
    
    static var setScoreBoardWidth: CGFloat { CustomSize.fullWidth * (89 / 844) }
    static var setScoreBoardHeight: CGFloat { CustomSize.fullHeight * (67 / 390) }
    
    static var buttonWidth: CGFloat { CustomSize.fullWidth * (85 / 844) }
    static var buttonHeight: CGFloat { buttonWidth }
    
    
    // ResultView: Landscape
    static var resultIconWidth: CGFloat { CustomSize.fullWidth * (100 / 844) }
    static var resultIconHeight: CGFloat { buttonWidth }
    
    static var questionFontSize: CGFloat {CustomSize.fullWidth * (100 / 844)}
    static var choiceIconWidth: CGFloat {CustomSize.fullWidth * 0.25}
    
}
