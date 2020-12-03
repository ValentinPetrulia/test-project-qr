//
//  ItemRow.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 30.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import UIKit

class ItemRow: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(0.15))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight(0.12))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let externalCircle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 0.35
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let internalCircle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 0.35
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: frame.width - 30).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(codeLabel)
        codeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        codeLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
        codeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(externalCircle)
        externalCircle.heightAnchor.constraint(equalToConstant: 24).isActive = true
        externalCircle.widthAnchor.constraint(equalToConstant: 24).isActive = true
        externalCircle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        externalCircle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
        addSubview(internalCircle)
        internalCircle.heightAnchor.constraint(equalToConstant: 12).isActive = true
        internalCircle.widthAnchor.constraint(equalToConstant: 12).isActive = true
        internalCircle.centerYAnchor.constraint(equalTo: externalCircle.centerYAnchor).isActive = true
        internalCircle.centerXAnchor.constraint(equalTo: externalCircle.centerXAnchor).isActive = true
    }
    
    func update(item: Item) {
        nameLabel.text = item.name
        if let code = item.code {
            codeLabel.text = "Code: " + code
        }
    }
}
