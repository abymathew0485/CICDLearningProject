//
//  ViewController.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 16/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var items: [MenuCellController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        items = MenuViewModel.allItems.map { MenuCellController().configureCell(tableView, viewModel: $0) }
        tableView.reloadData()
    }

}

extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return items[indexPath.row].cell
    }
}
