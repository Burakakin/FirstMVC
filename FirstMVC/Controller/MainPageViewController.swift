//
//  MainPageViewController.swift
//  FirstMVC
//
//  Created by Burak Akin on 23.08.2018.
//  Copyright © 2018 Burak Akin. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var mainPageNetworking = MainPageNetworking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        mainPageNetworking.getData(urlString: "https://rss.itunes.apple.com/api/v1/tr/movies/top-movies/all/25/explicit.json") { (feed) in
            print(feed?[1].name ?? "slm")
        }
    }

   
    

    var feedResult = [MainPageNetworking.Results](){
        didSet{

        }
    }

    

}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainPageTableViewCell
        let info = feedResult[indexPath.row]
        cell.appLabel.text = info.name
        return cell
    }
    
    
    
    
    
}
