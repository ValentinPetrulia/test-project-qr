//
//  ItemsVC.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 27.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import UIKit

class ItemsVC: UIViewController {
    
    var data = ItemsData()
    
    let itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
        setupLayout()
        setupNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isTranslucent = false
    }
    
   private func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(itemsCollectionView)
        itemsCollectionView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        itemsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        itemsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        itemsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupNavigationBarItems() {
        let title = UILabel()
        title.text = "Items"
        title.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(0.2))
        navigationItem.titleView = title
        
        let scanButton = UIButton(type: .system)
        scanButton.setTitle("Scan QR", for: .normal)
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: scanButton)
    }
    
    @objc private func scanButtonTapped() {
        let vc = QRScannerVC()
        vc.data = data
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension ItemsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.update(item: data.items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (collectionView.frame.width - 2) / 2
        return CGSize(width: widthCell, height: widthCell + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
