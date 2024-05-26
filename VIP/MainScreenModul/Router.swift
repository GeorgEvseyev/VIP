//
//  Router.swift
//  VIP
//
//  Created by Георгий Евсеев on 9.05.24.
//

import Foundation

protocol IMainRouter: AnyObject {
    func navigateButtonPressed()
}

class MainRouter {
    weak var view: MainViewController?
}

extension MainRouter: IMainRouter {
    func navigateButtonPressed() {
    }
}
