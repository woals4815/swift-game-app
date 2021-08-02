//
//  MainViewController.swift
//  game app
//
//  Created by 정재민 on 2021/07/30.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var controlStackView: UIStackView!
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var timeBar: UIProgressView!
    
    let screenX = [390,330,270,210,150,90,30]
    
    //유저가 계단 누른 수
    var userStep = 0
    //현재 왼쪽을 향해 있는 지
    var isLeft = true
    //타이머 초기화
    var timer = Timer()
    //음 총 시간? 
    var totalTime = 3
    
    var isStarted = false
    
    var charImgView: UIImageView?
    
    let charHeight = 80
    let charWidth = 60
    
    let brickHeight = 30
    let brickWidth = 60
    var subView = UIView()
    
    let timeQueue = DispatchQueue(label: "timeQueue", attributes: .concurrent)
    let presentQueue = DispatchQueue(label: "presentQueue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subView.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        self.view.addSubview(subView)
        
        self.view.bringSubviewToFront(controlStackView)
        upBtn.layer.masksToBounds = true
        upBtn.layer.cornerRadius = 5
        turnBtn.layer.masksToBounds = true
        turnBtn.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        upBtn.layer.borderWidth = 1
        turnBtn.layer.borderWidth = 1
        self.navigationItem.hidesBackButton = true
        
        //MARK: Character location
        let charImg = UIImage(named: "left")
        let charImgView = UIImageView(image: charImg)
        charImgView.frame = CGRect(x: 330, y: 734, width: charWidth, height: charHeight)
        self.subView.addSubview(charImgView)
        self.charImgView = charImgView
        
        let screen = UIScreen.main.bounds
        print("Width: \(screen.size.width)")
        print("Height: \(screen.size.height)")
        for i in 0...5{
            let imgName = "brick"
            let img = UIImage(named: imgName)
            let imgView = UIImageView(image: img)
            imgView.frame = CGRect(x: 390-(i+1)*brickWidth, y: 844-(i+1)*brickHeight, width: brickWidth, height: brickHeight)
            //            print("\(i+1)번째 벽돌: \(imgView)")
            self.subView.addSubview(imgView)
        }
        //        for i in 0...6 {
        //            let imgName = "brick"
        //            let img = UIImage(named: imgName)
        //            let imgView = UIImageView(image: img)
        //            imgView.frame = CGRect(x: 30 + i*brickWidth, y: 664-i*brickHeight, width: brickWidth, height: brickHeight)
        //            self.subView.addSubview(imgView)
        //        }
    }
    //MARK: prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let endVC = segue.destination as? EndViewController else { return }
        endVC.userStep = userStep
    }
    
    //MARK: Tab UpBtn Func
    @IBAction func tabUpbtn(_ sender: UIButton) {
        userStep += 1
        if isLeft{
            moveLeft()
            timeChangeWhenMove()
        } else {
            moveRight()
            timeChangeWhenMove()
        }
    }
    //MARK: move left function
    private func moveLeft() {
        charImgView?.frame = (charImgView?.frame.offsetBy(dx: -CGFloat(brickWidth), dy: -CGFloat(brickHeight)))!
        subView.frame = subView.frame.offsetBy(dx: 0, dy: CGFloat(brickHeight))
    }
    //MARK: move right function
    private func moveRight() {
        charImgView?.frame = (charImgView?.frame.offsetBy(dx: CGFloat(brickWidth), dy: -CGFloat(brickHeight)))!
        subView.frame = subView.frame.offsetBy(dx: 0, dy: CGFloat(brickHeight))
    }
    
    //MARK: Tab turnBtn Func
    @IBAction func tabTurnBtn(_ sender: UIButton) {
        if isLeft {
            turnToRight()
            changeSubViewPort()
            timeChangeWhenMove()
        } else {
            turnToLeft()
            changeSubViewPort()
            timeChangeWhenMove()
        }
    }
    //MARK: startTime func
    private func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)
    }
    //MARK: Turn to right function
    private func turnToRight() {
        charImgView!.image = UIImage(named: "right")
        charImgView?.frame = (charImgView?.frame.offsetBy(dx: CGFloat(brickWidth), dy: -CGFloat(brickHeight)))!
        userStep += 1
        isLeft = false
    }
    //MARK: Turn to left function
    private func turnToLeft() {
        charImgView!.image = UIImage(named: "left")
        charImgView?.frame = (charImgView?.frame.offsetBy(dx: -CGFloat(brickWidth), dy: -CGFloat(brickHeight)))!
        userStep += 1
        isLeft = true
    }
    //MARK: printTime func
    @objc func printTime() {
        print(totalTime)
        if totalTime == 0 {
            timer.invalidate()
            DispatchQueue.main.async {
                self.presentModal()
            }
        }
        totalTime -= 1
        timeBar.progress = Float(totalTime+1)/3
    }
    //MARK: performSegue func
    private func presentModal() {
        performSegue(withIdentifier: "endSegue", sender: nil)
    }
    //MARK: change subview view port function
    private func changeSubViewPort() {
        subView.frame = subView.frame.offsetBy(dx: 0, dy: CGFloat(brickHeight))
    }
    //MARK: timeQueue function
    private func timeChangeWhenMove() {
        if !isStarted{
            timeQueue.sync {
                self.startTime()
            }
            isStarted = true
        } else {
            totalTime = 3
            timer.invalidate()
            timeQueue.sync {
                self.startTime()
            }
        }
    }
}
