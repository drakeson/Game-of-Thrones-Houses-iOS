//
//  HousesVM.swift
//  Game of Thrones Houses
//
//  Created by Kato Drake Smith on 25/08/2022.
//

import Foundation
class HousesVM: NSObject {
    
    //MARK:- House CallBack
        typealias houseCallBack = (_ status:Bool, _ house: Any, _ message: String) -> Void
        var housesCallBack:houseCallBack?
        var houseData = [House]()
        
        //fileprivate
        func getHouses(_ url:URL){
            //let url = URL(string: "https://anapioficeandfire.com/api/houses")
            //
            URLSession.shared.dataTask(with: url) { data, response, err in
                if err == nil {
                    do {
                        self.houseData = try JSONDecoder().decode([House].self, from: data!)
                        self.housesCallBack?(true, self.houseData, GOTH.AppMessages.success)
                    }
                    catch {
                        self.housesCallBack?(false, self.houseData, GOTH.AppMessages.error)
                    }
                }
            }.resume()
        }
        
        func housesCompletionHandler(callBack: @escaping houseCallBack) {
            self.housesCallBack = callBack
        }
}
