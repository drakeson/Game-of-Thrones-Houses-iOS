//
//  GOTH.swift
//  Game of Thrones Houses
//
//  Created by Kato Drake Smith on 25/08/2022.
//

import Foundation

struct GOTH {
    
    static let mainURL = "https://anapioficeandfire.com/api/"
    
    //MARK:- MESSAGES
    struct AppMessages {
        static let success = "Successful"
        static let error = "Error fetching data from api"
        static let load = "Loading..."
        static let tryA = "Try Again"
        static let wifi = "Wifi Connection"
        static let mobile = "Cellular Connection"
        static let unavailable = "Internet Not Avialable"
        static let noConnection = "No Connection"
    }
    
    //MARK:- ServerMessages
    struct ServerMessages {
        static let m404 = "No Items Found"
        static let m500 = "Server Error"
        static let m402 = "Request Failed Try Again"
        static let mRest = "Try Again Later"
    }
    
}
