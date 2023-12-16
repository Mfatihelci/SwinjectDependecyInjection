//
//  ViewController.swift
//  SwiftDependecyInjection
//
//  Created by Muhammed fatih Elçi on 16.12.2023.
//

import UIKit
import Swinject

class ViewController: UIViewController {

    
    //Swinject
    let container : Container = {
       let container = Container()
        container.register(BackgoundProvidingClass.self) { resolver in
            return BackgoundProvidingClass()
        }
        
        container.register(SecondViewController.self) { resolver in
            let vc = SecondViewController(providerProtocol: resolver.resolve(BackgoundProvidingClass.self))
            return vc
        }
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .yellow
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Open Another VC", for: .normal)
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func buttonClicked() {
        if let viewController = container.resolve(SecondViewController.self) {
            present(viewController,animated: true)
        }
    }
}

