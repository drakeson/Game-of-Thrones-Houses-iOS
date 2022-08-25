//
//  DetailsVC.swift
//  Game of Thrones Houses
//
//  Created by Kato Drake Smith on 25/08/2022.
//

import UIKit

class DetailsVC: UIViewController {

    var house: House?
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseRegion: UILabel!
    @IBOutlet weak var houseCoatOfArms: UILabel!
    @IBOutlet weak var houseWords: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK:- Update UI
    func updateUI(){
        self.navBar.topItem?.title = house?.name
        houseName.text = house?.name
        houseRegion.text = "Region: \(house?.region ?? "")"
        
        if house?.coatOfArms != ""{
            houseCoatOfArms.text = "Coat Of Arms: \(house?.coatOfArms ?? "")"
        } else {
            houseCoatOfArms.isHidden = true
        }
        if house?.words != ""{
            houseWords.text = "Words: \(house?.words ?? "")"
        } else {
            houseWords.isHidden = true
        }
        
        let newName = house?.name.replacingOccurrences(of: "House ", with: "")
        houseImage.image = IPImage(text: newName!, radius: 25, font: nil, textColor: nil, randomBackgroundColor: true).generateImage()
    }

    
    
    @IBAction func backButton(_ sender: Any) {self.dismiss(animated: true, completion: nil)}
    
}
