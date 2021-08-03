//
//  EndViewController.swift
//  game app
//
//  Created by 정재민 on 2021/07/30.
//

import UIKit

class EndViewController: UIViewController {
    @IBOutlet weak var totalStairsText: UILabel!
    @IBOutlet weak var timeText: UILabel!
    var userStep = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalStairsText.text = "\(self.userStep)"
        // Do any additional setup after loading the view.
    }
    @IBAction func tabRestartBtn(_ sender: UIButton) {
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
