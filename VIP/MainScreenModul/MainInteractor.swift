//
//  Interactor.swift
//  VIP
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

protocol IMainInteractor: AnyObject {
    func buttonPressed()
}

final class MainInteractor {
    private var networkManager: INetworkManager = NetworkManager()
    var presenter: IMainPresenter
    init(presenter: IMainPresenter) {
        self.presenter = presenter
    }
}

extension MainInteractor: IMainInteractor {
    
    func buttonPressed() {
        networkManager.request(adress: UrlString().baseUrlString) { data, error in
            if let data = data {
                self.presenter.parse(data: data)
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
