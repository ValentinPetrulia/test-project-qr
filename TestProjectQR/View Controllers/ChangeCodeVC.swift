//
//  ChangeCodeVC.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 29.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import UIKit

class ChangeCodeVC: UIViewController {

    var code: String?
    var data: ItemsData?
    var chosenIndex: Int?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemRow.self, forCellReuseIdentifier: "ItemRow")
        tableView.backgroundColor = .white
        return tableView
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(0.16))
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupLayout()
        setupNavigationBarItems()
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(codeLabel)
        codeLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        codeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        if let code = code { codeLabel.text = "New code: \(code)" }
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 10).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: CGFloat((data?.items.count)! * 80)).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupNavigationBarItems() {
        let title = UILabel()
        title.text = "Change Code"
        title.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(0.2))
        navigationItem.titleView = title
        
        let applyButton = UIButton(type: .system)
        applyButton.setTitle("Apply", for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonIsTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: applyButton)
    }
    
    @objc private func applyButtonIsTapped() {
        if let index = chosenIndex {
            data?.items[index].code = code
        }
        let vc = ItemsVC()
        vc.data = data!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ChangeCodeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemRow", for: indexPath) as! ItemRow
        cell.update(item: (data?.items[indexPath.row])!)
        return cell
    }
    
    private func getAllCells() -> [ItemRow] {
        var cells = [ItemRow]()
            for i in 0..<tableView.numberOfRows(inSection: 0)
            {
                let cell = tableView.cellForRow(at: NSIndexPath(row: i, section: 0) as IndexPath) as! ItemRow
                cells.append(cell)
            }
        return cells
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! ItemRow
        let allCells = getAllCells()
        for i in 0..<allCells.count {
            if i == indexPath.item { continue }
            allCells[i].internalCircle.backgroundColor = .white
        }
        cell.internalCircle.backgroundColor = .black 
        chosenIndex = indexPath.item
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

