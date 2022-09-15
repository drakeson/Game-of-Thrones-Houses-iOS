//
//  HousesVM.swift
//  Game of Thrones Houses
//
//  Created by Kato Drake Smith on 25/08/2022.
//

import Foundation

class HousesVM: NSObject {
    
    //MARK: - House CallBack
        typealias houseCallBack = (_ status:Bool, _ house: Any, _ message: String) -> Void
        var housesCallBack:houseCallBack?
        var houseData = [House]()
        
        func getHouses(_ url:URL){
            URLSession.shared.dataTask(with: url) { data, response, err in
                if err == nil {
                    do {
                        self.houseData = try JSONDecoder()
                            .decode([House].self, from: data!)
                        self.housesCallBack?(true, self.houseData,
                                             Constants.AppMessages.success)
                    }
                    catch {
                        self.housesCallBack?(false, self.houseData,
                                             Constants.AppMessages.error)
                    }
                }
            }.resume()
        }
        
        func housesCompletionHandler(callBack: @escaping houseCallBack) {
            self.housesCallBack = callBack
        }
}
