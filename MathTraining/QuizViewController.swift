//
//  QuizViewController.swift
//  MathTraining
//
//  Created by 桑野友輔 on 2023/03/12.
//

import UIKit

class QuizViewController: UIViewController {
    
    let total = 10 //問題数
    var correct = 0 //正解数
    var questionIndex = 0 //問題の番号
    var answeIndex = 0 //正解の番号
    
    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var canterNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestions()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapped(sender: UIButton) {
        //選択されたボタンの番号(tagで設定した番号)がansweIndexの番号と一致すれば
        if sender.tag - 1 == answeIndex {
            correct += 1
        }
        //問題数を＋１する
        questionIndex += 1
        //もし問題数がトータルを超えたら移動する、そうでない倍はsetQuestionを走らせる
        if questionIndex >= total {
            performSegue(withIdentifier: "QuizToResult", sender: nil)
        }else{
            setQuestions()
        }
    }
    
    func setQuestions() {
        //arc4random_uniform(Uint32)はランダムに括弧内の数値を選出する、Intで囲い数値に変換する
        let leftNum = Int(arc4random_uniform(10))
        var centerNum = Int(arc4random_uniform(10))
        
        answeIndex = Int(arc4random_uniform(4))
        switch answeIndex {
        case 0:
            //answeIndexの値が0の場合、右の値は左と中央の値を足したものになる
            rightNumberLabel.text = "\(leftNum + centerNum)"
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        default:
            if centerNum == 0 {
                centerNum = 1
            }
            rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        
    }
}
