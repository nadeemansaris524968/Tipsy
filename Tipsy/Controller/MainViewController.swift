//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet var percentBtns: [UIButton]!
    
    var tipSelected: Float = 0.1
    var splitSelected: Float = 2.0
    var amountCalculator = AmountCalculator()
    var totalPerPerson: Float? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        if sender.tag == 0 {
            tipSelected = 0
        } else if sender.tag == 1 {
            tipSelected = 0.1
        } else {
            tipSelected = 0.2
        }
        for btn in percentBtns {
            if btn.tag != sender.tag {
                btn.isSelected = false
            }
        }
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        splitSelected = Float(sender.value)
        splitLabel.text = String(format: "%.0f", splitSelected)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billTotalString = billTotalTextField.text else { return }
        guard let billAmount = Float(billTotalString) else { return }
        
        let totalTip = amountCalculator
            .getTotalTip(bill: billAmount, split: tipSelected)
        
        totalPerPerson = amountCalculator
            .calculateFinalAmount(bill: billAmount, tip: totalTip, split: splitSelected)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            guard let totalPerPerson = totalPerPerson else { return }
            guard let destinationVC = segue.destination as? ResultViewController else { return }
            destinationVC.resultValue = totalPerPerson
            destinationVC.resultSubtext = "Split between \(String(format: "%.0f", splitSelected)) people, with \(String(format: "%.0f", (tipSelected * 100)))% tip."
        }
    }
}
