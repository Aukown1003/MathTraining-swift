//
//  ResultViewController.swift
//  MathTraining
//
//  Created by 桑野友輔 on 2023/03/12.
//

import UIKit

class ResultViewController: UIViewController {
    var result = 0.0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "\(round(result))%"
        if result < 50 {
            messageLabel.text = "Please Try Again!"
        }else if result < 80 {
            messageLabel.text = "Nice!"
        }else{
            messageLabel.text = "You Are Great!"
        }
    }
    

}
