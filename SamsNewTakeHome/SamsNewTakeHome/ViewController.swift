//
//  ViewController.swift
//  SamsNewTakeHome
//
//  Created by Franklin Mott on 8/11/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    static var listOfArticles: [ArticleInfo] = []
    let articleTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        setupTableView()
        setupSearchBar()
        
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search articles"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    func setupTableView() -> Bool {
        articleTableView.register(ArticleCell.self, forCellReuseIdentifier: "articleCell")
        view.addSubview(articleTableView)
        NSLayoutConstraint.activate([
            articleTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            articleTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            articleTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            articleTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
        articleTableView.delegate = self
        articleTableView.dataSource = self
        let finished = true
        return finished
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else {return}
        let ar = ArticleRequest(searchArt: text)
        ar.getArticles { [weak self] result in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let articles):
                ViewController.listOfArticles = articles
                // add urlsession for images
                DispatchQueue.main.async {
                    self!.articleTableView.reloadData()
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ViewController.listOfArticles.count <= 30 {
            return ViewController.listOfArticles.count
        } else {
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        let article = ViewController.listOfArticles[indexPath.row]
        cell.authorLabel.text = article.author
        cell.titleLabel.text = article.title
        cell.ArtImageView.image(fromUrl: article.urlToImage ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dc = DisplayViewController()
        dc.displayAuthor.text = ViewController.listOfArticles[indexPath.row].author
        dc.displayDescription.text = ViewController.listOfArticles[indexPath.row].description
        dc.displayTitle.text = ViewController.listOfArticles[indexPath.row].title
        dc.displayPublish.text = ViewController.listOfArticles[indexPath.row].content
        //dc.displayImage.image = ViewController.listOfArticles[indexPath.row].urlToImage
        dc.displayImage.image(fromUrl: ViewController.listOfArticles[indexPath.row].urlToImage ?? "")
        self.navigationController?.pushViewController(dc, animated: true)
    }
}
extension UIImageView {
    public func image(fromUrl urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Couldn't create URL from \(urlString)")
            return
        }
        let theTask = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: response)
                }
            }
        }
        theTask.resume()
    }
}

class ArticleCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Author"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Title"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let ArtImageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.blue
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(authorLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(ArtImageView)
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        ArtImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        ArtImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        ArtImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor , constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 25).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: ArtImageView.trailingAnchor, constant: 25).isActive = true
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        authorLabel.leadingAnchor.constraint(equalTo: ArtImageView.trailingAnchor, constant: 20).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        authorLabel.numberOfLines = 1
        
        //: Mark TODO: add constraints for cell here!
    }
}
class ArticleRequest {
    let articleUrl:URL
    let API_KEY = "144ed5cdfe994830897159c56f275d82"
    init(searchArt: String) {
        
        let urlString = "https://newsapi.org/v2/everything?q=\(searchArt)&sortBy=publishedAt&apiKey=\(API_KEY)"
        guard let articleUrl = URL(string: urlString) else {fatalError()}
        self.articleUrl = articleUrl
    }

    func getArticles (completion: @escaping(Result<[ArticleInfo], Error>) -> Void) {
        URLSession.shared.dataTask(with: articleUrl){ (dat, resp, err) in

            guard let data = dat else {
                print("data not retrieved")
                return
            }
            do {
                let decoder = JSONDecoder()
                let articleResponse = try decoder.decode(ArticleResponse.self , from: data)
                let articleDetails = articleResponse.articles
                completion(Result.success(articleDetails))
                print(articleDetails.count)
            } catch {
                print("Error decoding data")
            }
            guard let response = resp else {
                print("response not found")
                return
            }
        }.resume()
    }
    
}
struct ArticleResponse: Decodable {
    let articles: [ArticleInfo]
}

struct ArticleInfo: Decodable {
    let author: String?
    let title: String
    let description: String
    let urlToImage: String?
    let content: String
}
