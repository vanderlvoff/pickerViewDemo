//
//  PickerViewController.swift
//  pickerViewDemo
//
//  Created by YURY LVOV on 21.02.2019.
//  Copyright © 2019 YURY LVOV. All rights reserved.
//

import UIKit
class PickerViewController: UIViewController,
UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    
    let visibleList = ["100B","150B","200B"]
    let valueList = [100,150,200]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        pickerView.delegate = self
        pickerView.dataSource = self
        label.text = "Set the value"
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return visibleList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return visibleList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int){
        label.text = visibleList[row]
    }
    
    @IBAction func buttontapped(_ sender: Any) {
        performSegue(withIdentifier: "toViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toViewController") {
            let vc: ViewController = (segue.destination as? ViewController)!
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            print(selectedRow);
           
            vc.targetAge = valueList[selectedRow]
        }
    }
}
