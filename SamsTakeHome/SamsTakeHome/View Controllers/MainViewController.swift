//
//  MainViewController.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 7/30/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.placeholder = "Search Articles"
        
        // Do any additional setup after loading the view.
    }
    

    

}
extension MainViewController: UITableViewDelegate {
    
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        // add cell logic in ArticleCell file
        return cell
        
    }
    
    
}
