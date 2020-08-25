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
        displayImage.backgroundColor = .red
        

    }
    


}
