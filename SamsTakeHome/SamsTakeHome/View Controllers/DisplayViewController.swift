//
//  DisplayViewController.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 7/30/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    @IBOutlet weak var displayImageView: UIImageView!
    
    @IBOutlet weak var disTitleLabel: UILabel!
    @IBOutlet weak var disAuthorLabel: UILabel!
    @IBOutlet weak var publishLabel: UILabel!
    
    @IBOutlet weak var descTextView: UITextView!
    let vm = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
