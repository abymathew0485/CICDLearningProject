//
//  MenuCellController.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 24/12/22.
//

import UIKit

final class MenuCellController {

    private let viewModel: MenuViewModel
    private var cell: MenuTableViewCell?

    init(viewModel: MenuViewModel){
        self.viewModel = viewModel
    }

    func view(in tableView: UITableView) -> MenuTableViewCell {
        let cell: MenuTableViewCell = self.cell ?? tableView.dequeueReusableCell(withIdentifier: String(describing: MenuTableViewCell.self)) as! MenuTableViewCell
        self.cell = cell
        cell.configureCell(with: viewModel)
        return cell
    }
}
