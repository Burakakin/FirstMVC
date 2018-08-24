//
//  File.swift
//  FirstMVC
//
//  Created by Burak Akin on 23.08.2018.
//  Copyright © 2018 Burak Akin. All rights reserved.
//

import Foundation

class MainPageNetworking {
    
    struct appleApi: Decodable {
        let feed: Feed
    }
    
    struct Feed: Decodable {
        let results: [Results]
    }
    
    struct Results: Decodable {
        let name: String
        let artworkUrl100: String
    }
    
//
//
//    func getJson(urlString: String){
//        let url = URL(string: urlString)
//        URLSession.shared.dataTask(with: url!) { (data, response, err) in
//            guard let data = data else { return }
//            self.getData(jsonData: data)
//            }.resume()
//
//
//    }
//
//    @discardableResult func getData(jsonData: Data) -> [Results]? {
//
//        do{
//            let appleData = try JSONDecoder().decode(appleApi.self, from: jsonData)
//            let appData = appleData.feed.results
//            //print(appData)
//            return appData
//
//        }catch let err{
//            print("Error", err )
//            return nil
//        }
//
//    }
//
    
    
    func getData(urlString: String, completion: @escaping (_ feedResult: [Results]?) -> Void) {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else { return }
            do{
                let appleData = try JSONDecoder().decode(appleApi.self, from: data)
                let appData = appleData.feed.results
                //print(appData)
                var feedResult = [Results]()
                feedResult.append(contentsOf: appData)
                completion(feedResult)
                print(feedResult[0].name)

            }catch let err{
                print("Error", err )
               
            }
            }.resume()
        
       
        
    }
    
    
    
    
}

