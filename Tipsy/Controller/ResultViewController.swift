//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Nadeem Ansari on 6/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit
class ResultViewController: UIViewController {
 
    @IBOutlet weak var resultValueLabel: UILabel!
    @IBOutlet weak var resultSubtextLabel: UILabel!
    @IBOutlet weak var recalculateBtn: UIButton!
    
    var resultValue: Float? = nil
    var resultSubtext: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recalculateBtn.layer.cornerRadius = 5
        guard let safeResultValue = resultValue else { return }
        guard let safeResultSubtext = resultSubtext else { return }
        resultValueLabel.text = String(format: "%.2f", safeResultValue)
        resultSubtextLabel.text = safeResultSubtext
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
