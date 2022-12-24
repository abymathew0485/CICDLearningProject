//
//  MenuCellController.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 24/12/22.
//

import UIKit

class MenuCellController {

    func configureCell(_ tableView: UITableView, viewModel: MenuViewModel) -> MenuTableViewCell {

        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuTableViewCell.self)) as! MenuTableViewCell
        cell.configureCell(with: viewModel)
        return cell
    }

}
