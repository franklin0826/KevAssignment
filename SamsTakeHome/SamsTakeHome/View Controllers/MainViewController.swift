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
    
    let vm = ViewModel()
    
    var searchActive : Bool = false
    var filteredArticles : [Article] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.placeholder = "Search Articles"
        vm.searchText = "Cool Cats"
        let newArticles = vm.getArticles()
        
        
    }
    //retieve entered text from search bar. use text to filter list of articles returned from api. add those filtered items into a new array of filtered items. used array to populate table view
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let text = searchBar.text
        vm.searchText = text ?? "Cool Cats"
        vm.getArticles()
    }

    

}
extension MainViewController: UITableViewDelegate {
    
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        // add cell logic in ArticleCell file
        return cell
    }

    
    
}
