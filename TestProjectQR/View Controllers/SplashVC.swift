//
//  SplashVC.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 27.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

   private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jordan")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupLayout()
        self.navigationController?.navigationBar.isHidden = true
        self.delay(1) {
            let vc = ItemsVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   private func setupLayout() {
        view.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }
    
   private func delay(_ delay: Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }

}
