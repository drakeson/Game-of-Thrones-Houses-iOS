//
//  ViewController.swift
//  Game of Thrones Houses
//
//  Created by Kato Drake Smith on 25/08/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,
                      UITableViewDataSource {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var houseTableView: UITableView!
    var housesVM = HousesVM()
    var houseList = [House]()
    let reachability = try! Reachability()
    
    //MARK: - Activity Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        houseTableView.delegate = self
        houseTableView.dataSource = self
        downloadJSON()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged,
                                               object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            print(Constants.AppMessages.wifi)
        case .cellular:
            print(Constants.AppMessages.mobile)
        case .unavailable:
            self.navBar.topItem?.title = Constants.AppMessages.unavailable
            print(Constants.AppMessages.unavailable)
        case .none:
            self.navBar.topItem?.title = Constants.AppMessages.noConnection
            print(Constants.AppMessages.noConnection)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name:
                .reachabilityChanged, object: reachability)
    }
    
    
    //MARK: - UI Table View Start
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell", for: indexPath) as! HouseCell
        let house = houseList[indexPath.row]
        DispatchQueue.main.async {
            cell.houseName.text = house.name
            cell.houseRegion.text = house.region
            cell.coatOfArms.text = house.coatOfArms
            let newName = house.name.replacingOccurrences(of: "House ", with: "")
            cell.houseImage.image = IPImage(text: newName, radius: 25, font: nil,
                                            textColor: nil, randomBackgroundColor: true).generateImage()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deatilVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
        deatilVC.house = houseList[houseTableView.indexPathForSelectedRow!.row]
        self.present(deatilVC, animated: true)

    }
    
    
    //MARK: - Get JSON Data
    func downloadJSON() {
        ERProgressHud.sharedInstance.show(withTitle: Constants.AppMessages.load)
        housesVM.housesCompletionHandler{ [weak self] (status, houses, message) in
            guard self != nil else {return}
            if status {
                    DispatchQueue.main.async {
                        ERProgressHud.sharedInstance.hide()
                        self!.houseList = houses as! [House]
                        self!.houseTableView.reloadData()
                    }
                } else {
                    ERProgressHud.sharedInstance.hide()
                }
        }
        housesVM.getHouses(URL(string: "\(Constants.mainURL)houses")!)
    }
    
    
}

