//
//  Presenter.swift
//  VIP
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit


protocol IMainPresenter: AnyObject {
    func parse(data: Data)
}

final class MainPresenter: IMainPresenter {
    
    weak var view: IMainViewController?
    init(view: IMainViewController) {
        self.view = view
    }
    
    func parse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data) as? [Any] {
            view?.setLabelText("json: \(json)")
        }
    }
}

