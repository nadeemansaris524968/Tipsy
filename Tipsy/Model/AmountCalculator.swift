//
//  AmountCalculator.swift
//  Tipsy
//
//  Created by Nadeem Ansari on 6/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct AmountCalculator {
    
    func calculateFinalAmount(bill billTotal: Float,
                              tip totalTip: Float,
                              split splitSelected: Float) -> Float {
        return (totalTip + billTotal)/splitSelected
    }
    
    func getTotalTip(bill billTotal: Float, split tipPercent: Float) -> Float {
        return billTotal * tipPercent
    }
}
