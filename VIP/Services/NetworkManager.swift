//
//  NetworkManager.swift
//  VIP
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

protocol INetworkManager {
    func request(adress: String, completion: @escaping(Data?, Error?) -> Void)
}

class NetworkManager: INetworkManager {

    func request(adress: String, completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: adress) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
