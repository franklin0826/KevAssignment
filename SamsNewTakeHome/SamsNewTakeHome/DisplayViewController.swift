//
//  DisplayViewController.swift
//  SamsNewTakeHome
//
//  Created by Franklin Mott on 8/19/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    let displayImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.orange
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let displayAuthor: UILabel = {
        let lbl = UILabel()
        lbl.text = "Author"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let displayTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Article Title"
        return lbl
    }()
    let displayPublish: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Publish Date 0000/00/00"
        return lbl
    }()
    let displayDescription: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "krejnfehrjnfhrnfer f rb rj fjr r fjr jr jr j rjb vbr vbr brt b tb tb jrt tr"
        return lbl
    }()
    let displayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = .gray

        // Do any additional setup after loading the view.
    }
    func setupViewController() {
    
        view.addSubview(displayView)
        displayView.addSubview(displayImage)
        displayView.addSubview(displayTitle)
        displayView.addSubview(displayAuthor)
        displayView.addSubview(displayDescription)
        displayView.addSubview(displayPublish)
        
        // setup imageview
        displayImage.backgroundColor = .black
        displayImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        displayImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        displayImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        displayImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
        // setup labels
        displayTitle.topAnchor.constraint(equalTo: displayImage.bottomAnchor, constant: 20).isActive = true
        displayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        displayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50).isActive = true
        displayTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        displayTitle.numberOfLines = 2
        
        displayAuthor.topAnchor.constraint(equalTo: displayTitle.bottomAnchor, constant: 20).isActive = true
        displayAuthor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        displayAuthor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50).isActive = true
        displayAuthor.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        displayDescription.topAnchor.constraint(equalTo: displayAuthor.bottomAnchor, constant: 20).isActive = true
        displayDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        displayDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50).isActive = true
        displayDescription.lineBreakMode = .byWordWrapping
        displayDescription.numberOfLines = 0
        
        
        displayPublish.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        displayPublish.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        displayPublish.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50).isActive = true

        
        

    }
    


}
