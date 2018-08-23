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
    
    
  
    
    
    
    
}

