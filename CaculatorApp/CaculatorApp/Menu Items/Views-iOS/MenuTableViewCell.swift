//
//  MenuTableViewCell.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 24/12/22.
//

import UIKit


final class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(with viewModel: MenuViewModel) {
        titleLbl.text = viewModel.title
        subTitleLbl.text = viewModel.subTitle
    }

}
