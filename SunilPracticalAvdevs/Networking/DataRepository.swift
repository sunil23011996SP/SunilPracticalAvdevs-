//
//  DataRepository.swift
//  SunilPracticalAvdevs
//
//  Created by sunil prajapati on 09/04/25.
//

import Foundation

class DataRepository {
    
    // ===================================
    // MARK: - Get Country list
    // ===================================
    
    public func CountryList(action: @escaping (ReqStatus, Country?, Error?) -> Void) {
        
        
        action(ReqStatus.START, nil, nil)
        let mJson: [String: String] = [:]
        let urlReq = getUrlRequest(mUrl: AllApi.ALL, mMethod: ReqMethods.GET, json: mJson)
        URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
            guard let data = data, error == nil else {
                action(ReqStatus.ERROR, nil, error)
                return
            }
            do {
                let responseModel = try JSONDecoder().decode(Country.self, from: data)
                NSLog("CountryList: \(responseModel)", "")
                action(ReqStatus.SUCCESS, responseModel, nil)
            } catch let err {
                print(err)
                action(ReqStatus.ERROR, nil, err)
            }
        }.resume()
        
    } // RestaurantList
    
}
