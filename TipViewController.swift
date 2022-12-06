//
//  TipViewController.swift
//  TipApp
//
//  Created by 廖晨如 on 2022/12/6.
//

import UIKit

class TipViewController: UIViewController {
    
    
    
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let background = UIImageView(image: UIImage(named: "BG"))
        background.frame = view.bounds
        background.contentMode = .scaleAspectFill
        view.insertSubview(background, at: 0)
    }
    
    //點選空白處可收鍵盤
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
            view.endEditing(true)
    }

    
    
    @IBAction func calculate(_ sender: UITextField) {
       
        if(costTextField.text! != "" && tipTextField.text! != "" && numberTextField.text! != ""){
            if let cost = Float(costTextField.text!),
               let tipPercantage = Float(tipTextField.text!),
               let number = Float(numberTextField.text!){
                
                let total = cost * (1 + tipPercantage / 100)
                let tip = cost * (tipPercantage / 100)
                let share = total / number
                totalLabel.text = String(format: "%.2f", total)
                tipLabel.text = String(format: "%.2f", tip)
                shareLabel.text = String(format: "%.2f", share)
            }
            print("non nil")
        }else{//任一輸入為空
            print("nil")
            totalLabel.text = "0"
            tipLabel.text = "0"
            shareLabel.text = "0"
        }
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
