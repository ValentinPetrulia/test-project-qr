//
//  ItemModel.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 27.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import Foundation

struct Item {
    var name: String
    var imageName: String
    var code: String?
}

struct ItemsData {
    var items: [Item]
    
    init() {
        let item1 = Item(name: "Jordan 1", imageName: "jordan1", code: nil)
        let item2 = Item(name: "Jordan 2", imageName: "jordan2", code: "14")
        let item3 = Item(name: "Jordan 3", imageName: "jordan3", code: "8")
        let item4 = Item(name: "Jordan 4", imageName: "jordan4", code: nil)
        let item5 = Item(name: "Jordan 5", imageName: "jordan5", code: "1")
        let item6 = Item(name: "Jordan 6", imageName: "jordan6", code: nil)
        let item7 = Item(name: "Jordan 7", imageName: "jordan7", code: nil)
        
        items = [item1, item2, item3, item4, item5, item6, item7]
    }
}

