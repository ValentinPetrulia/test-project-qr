//
//  ItemCell.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 27.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.cornerRadius = 3
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.layer.borderWidth = 0.8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(0.16))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight(0.16))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        //let distance = (frame.height - nameLabel.frame.height - codeLabel.frame.height - imageView.frame.height) / 4
        
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: frame.width - 20).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true

        addSubview(codeLabel)
        codeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        codeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        codeLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor).isActive = true
        codeLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
    }
    
    func update(item: Item) {
        imageView.image = UIImage(named: item.imageName)
        nameLabel.text = item.name
        if let code = item.code {
            codeLabel.text = "Code: " + code
        }
    }
    
}
