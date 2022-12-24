//
//  Models.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 24/12/22.
//

struct Menu{
    let name: String
    let description: String
}

extension Menu {
    static var items: [Menu] {
        return [
            Menu(name: "Tomatto", description: "It's a Vegitable"),
            Menu(name: "Mango", description: "It's a Fruit"),
            Menu(name: "Apple", description: "It's a Fruit"),
            Menu(name: "Orange", description: "It's a Fruit"),
            Menu(name: "Chicken", description: "It's a Non-Vegitable"),
        ]
    }
}

struct ElectronicItem{
    let name: String
    let description: String
}

extension ElectronicItem {
    static var items: [ElectronicItem] {
        return [
            ElectronicItem(name: "TV", description: "It's for watching"),
            ElectronicItem(name: "iPhone", description: "It's for communication"),
            ElectronicItem(name: "Polk Speaker", description: "It's for entertainment"),
            ElectronicItem(name: "Computer", description: "It's for job"),
            ElectronicItem(name: "GameBox", description: "It's for Fun"),
        ]
    }
}
