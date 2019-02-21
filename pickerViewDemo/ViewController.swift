//
//  ViewController.swift
//  pickerViewDemo
//
//  Created by YURY LVOV on 21.02.2019.
//  Copyright © 2019 YURY LVOV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var age:Int = 1
    var targetAge:Int = 100
    var changeTheTarget:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        redraw()
    }
    
    func redraw()  {
        ageTextField.text = String(age) + "B¥"
        
        if targetAge - age == targetAge {
            messageLabel.text =  "Opps、bunkrupt"
        }else if age > targetAge {
            messageLabel.text = String(age-targetAge) + "B¥ Over"
        }else if age < targetAge {
            messageLabel.text = String(targetAge-age) + "B¥ short"
        }else {
            messageLabel.text = "Done!"
        }
    }
    
    @IBOutlet weak var ageTextField:UITextField!
    
    @IBAction func double(_ sender: UIButton) {     //2倍//
        age = age * 2
        redraw()
    }
    
    @IBAction func Triple(_ sender: UIButton) {    //3倍//
        age = age * 3
        redraw()
    }
    
    @IBAction func OneFifth(_ sender: UIButton) {   //5で割る//
        age = age / 5
        redraw()
    }
    
    @IBAction func clear(_ sender: UIButton) {     //リセット//
        age = 1
        redraw()
    }
    
    @IBOutlet weak var messageLabel: UILabel!    //textfieldの上のラベル//
}

