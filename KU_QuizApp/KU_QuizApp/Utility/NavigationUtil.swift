//
//  NavigationUtil.swift
//  KU_QuizApp
//
//  Created by Junyeong Park on 2022/06/21.
//

import Foundation
import UIKit

struct NavigationUtil {
    static func popToRootView() {
        let scenes = UIApplication.shared.connectedScenes
        let windows = scenes.filter{$0.activationState == .foregroundActive}.compactMap({$0 as? UIWindowScene}).first?.windows
        let keyWindow = windows?.filter{$0.isKeyWindow}.first
        findNavigationController(viewController: keyWindow?.rootViewController)?
                .popToRootViewController(animated: true)
        // Pop To Root
        // TODO: Navigation stack will not be updated -> Dimiss timing issue
    }

    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }

        return nil
    }
}
