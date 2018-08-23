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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getJson(urlString: "https://rss.itunes.apple.com/api/v1/tr/movies/top-movies/all/25/explicit.json")
    }

   
    
    
    var feedResult = [MainPageNetworking.Results]()
    
    
    func getJson(urlString: String){
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else { return }
            self.getData(jsonData: data)
            }.resume()
        
        
    }
    
    func getData(jsonData: Data){
        
        do{
            let appleData = try JSONDecoder().decode(MainPageNetworking.appleApi.self, from: jsonData)
            let appData = appleData.feed.results
            //print(appData)
            DispatchQueue.main.async {
                self.feedResult.append(contentsOf: appData)
                self.myTableView.reloadData()
                print(appData[0].name)
            }
            
        }catch let err{
            print("Error", err )
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
