//
//  ViewController.swift
//  VIP
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

protocol IMainViewController: AnyObject {
    func setLabelText(_ text: String)
}

final class MainViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var router: IMainRouter?
    var interactor: IMainInteractor?
    var presenter: IMainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
        
        setupDependencies()
    }
    
    func setupUI() {
        view.backgroundColor = .orange
        
        view.addSubview(label)
        label.backgroundColor = .white
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        view.addSubview(button)
        let action = UIAction { _ in
            self.buttonPressed()
        }
        button.addAction(action, for: .touchUpInside)
        button.backgroundColor = .blue
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupDependencies() {
        let presenter = MainPresenter(view: self)
        let interactor = MainInteractor(presenter: presenter)
        self.presenter = presenter
        self.interactor = interactor

    }
    
    func buttonPressed() {
        interactor?.buttonPressed()
    }
}

extension MainViewController: IMainViewController {
    func setLabelText(_ text: String) {
        DispatchQueue.main.async {
            self.label.text = text
        }
    }
}


