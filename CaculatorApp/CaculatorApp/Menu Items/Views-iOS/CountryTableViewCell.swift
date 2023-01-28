//
//  CountryTableViewCell.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 13/01/23.
//

import UIKit


extension String {
    func emojiToImage() -> UIImage? {
        let size = CGSize(width: 40, height: 45)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(CGRect(origin: CGPoint(), size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryNameCode: UILabel!
    @IBOutlet weak var countryCode: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureCellWith(_ country: CountryManager.Country) {
        flagImageView.image = country.flag.emojiToImage()
        nameLabel.text = country.name
        countryNameCode.text = country.nameCode
        countryCode.text = country.countryCode

    }



}


extension Int {

    var isZero: Bool {
        return (self == 0 )
    }


}
