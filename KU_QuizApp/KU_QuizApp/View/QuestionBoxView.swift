//
//  QuestionBoxView.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/22.
//

import SwiftUI

struct QuestionBoxView: View {
    let questionBox: String
    var body: some View {
        Text(.init(questionBox))
            .font(.headline)
            .multilineTextAlignment(.leading)
            .lineSpacing(3)
            .padding(.all, 10)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .padding(.horizontal, 5)
                )
    }
}

struct QuestionBoxView_Previews: PreviewProvider {
    static let questionBox = "㉠**일반**적으로 스포츠에 영향을 주는 날씨 요소는 크게 ㉡**온도**, 습도, 바람, ㉢**기압** 등이 꼽힌다. 물론 이들은 각각 개별적으로 작용하기보다는 복합적으로 ㉣**영향**을 주기 때문에 특정 ㉤**요인**만을 떼어 내 생각하기엔 어려움이 있다. \n 날씨 ㉥**요소** 가운데 지금까지 가장 연구가 많이 진행된 분야는 온도(열)이다. 대체로 인간은 운동과제를 ㉦**遂行**할 때가 공부 같은 정신적인 ㉧**課題**를 遂行할 때보다 온도 영향을 더 많이 받는 것으로 알려져 있다. 당연히 운동을 하면 ㉨**筋肉**에 에너지가 많이 ㉩**供給**돼야 하기 때문에 몸의 온도가 올라간다. 이 에너지는 글루코스(포도당)와 지방의 분해에 의해 생산 되는데, 이때 생긴 열이 몸의 온도를 높이는 것이다. \n 다행스럽게도 인체는 혈액의 온도가 37°C 이상 높아지면 가쁜 숨을 몰아쉬거나 땀샘을 통해 수분을 내보내고, 혈액 ⓐ**循環**의 비율과 정도를 변화시킴으로써 열을 발산한다. 그러 나 문제는 신체의 열이 일정 수준을 넘으면 에너지 ⓑ**生産**능력이 ⓒ**效率**적으로 이루어지지 않으면서 신체 활동이 ⓓ**急激**히 떨어진다는 데 있다. 여기에 신체 외부의 온도가 높으면 이 매커니즘은 더욱 ㉪**작동**하기 힘들어진다."
    static var previews: some View {
        QuestionBoxView(questionBox: questionBox)
    }
}
