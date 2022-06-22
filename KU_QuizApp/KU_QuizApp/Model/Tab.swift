//
//  Tab.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import SwiftUI

enum Tab{
    case first
    case second
    case third
    
    var title: String{
        switch self{
        case .first: return "학습"
        case .second: return "오답노트"
        case .third: return "점수"
        }
    }
}
