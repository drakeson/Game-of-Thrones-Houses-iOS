//
//  HouseCell.swift
//  Game of Thrones Houses
//
//  Created by Kato Drake Smith on 25/08/2022.
//

import UIKit

class HouseCell: UITableViewCell {

    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseRegion: UILabel!
    @IBOutlet weak var coatOfArms: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        houseName.lineBreakMode = NSLineBreakMode.byWordWrapping
        houseName.numberOfLines = 0
        houseRegion.lineBreakMode = NSLineBreakMode.byWordWrapping
        houseRegion.numberOfLines = 0
        coatOfArms.lineBreakMode = NSLineBreakMode.byWordWrapping
        coatOfArms.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
