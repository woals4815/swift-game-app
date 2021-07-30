//
//  MainViewController.swift
//  game app
//
//  Created by 정재민 on 2021/07/30.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var turnBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        upBtn.layer.masksToBounds = true
        upBtn.layer.cornerRadius = 5
        turnBtn.layer.masksToBounds = true
        turnBtn.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
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
