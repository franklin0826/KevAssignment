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
   
    
    var listOfArticles = [ArticleInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfArticles.count) found"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.placeholder = "Cool Cats"
        vm.searchText = "Cool Cats"
       
        
        
    }
    //retieve entered text from search bar. use text to filter list of articles returned from api. add those filtered items into a new array of filtered items. used array to populate table view
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        let articleRequest = ArticleRequest(searchArt: text)
        articleRequest.getArticles { [weak self] result in
            switch result {
            case.failure(let error):
                print(error)
            case .success(let articles):
                self?.listOfArticles = articles
                self!.tableView.reloadData()
            }
        }
    }

    

}
extension MainViewController: UITableViewDelegate {
    
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfArticles.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        let article = listOfArticles[indexPath.row]
        cell.authorLabel.text = article.author
        cell.titleLabel.text = article.title
        vm.displayAuthorText = article.author
        vm.displayTitleText = article.title
        vm.displayDescText = article.description
        vm.displayPublishText = article.content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
