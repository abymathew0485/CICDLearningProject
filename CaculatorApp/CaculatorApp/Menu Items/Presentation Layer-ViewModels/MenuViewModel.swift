//
//  MenuViewModel.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 24/12/22.
//


final class MenuViewModel {

    var title: String
    var subTitle: String

    init(_ menu: Menu){
        title = menu.name
        subTitle = menu.description
    }

    init(_ electronicItem: ElectronicItem){
        title = electronicItem.name
        subTitle = electronicItem.description
    }

    static var allItems: [MenuViewModel] {
        let firstItems = Menu.items.map { MenuViewModel($0) }
        let secondItems = ElectronicItem.items.map { MenuViewModel($0) }
        return firstItems + secondItems
    }

}
