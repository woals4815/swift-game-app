//
//  ViewController.swift
//  game app
//
//  Created by 정재민 on 2021/07/30.
//

import UIKit


//MARK: StartViewController
class StartViewController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    //MARK: StartViewController BackgrondImageView
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "startImg")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add imageView in main view
        self.view.insertSubview(imageView, at: 0)
        //Add contraints in imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        startBtn.layer.masksToBounds = true
        startBtn.layer.cornerRadius = 10
        startBtn.layer.borderWidth = 1
        
    }
    @IBAction func tabStartBtn(_ sender: UIButton) {
    }
    
}

