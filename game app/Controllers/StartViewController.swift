//
//  ViewController.swift
//  game app
//
//  Created by 정재민 on 2021/07/30.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameTitle.text = "무한 계단"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "infinite-stairs")!)
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 10
        
    }
    @IBAction func tabStartBtn(_ sender: Any) {
        print("hello")
    }
    
}

