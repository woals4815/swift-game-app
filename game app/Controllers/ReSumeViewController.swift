//
//  ReSumeViewController.swift
//  game app
//
//  Created by 정재민 on 2021/07/30.
//

import UIKit

class ReSumeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    @IBAction func tabResumeBtn(_ sender: UIButton) {
    }
    
    @IBAction func tabExitBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "unwindToStart", sender: self)
    }
}
