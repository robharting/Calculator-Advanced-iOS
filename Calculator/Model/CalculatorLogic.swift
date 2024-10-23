//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Harting, R.P.G. (Rob) on 21/10/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    // make global variables private
    private var number : Double?
    
    // tuple
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    // _ is the external parameter which can be nothing and the internal parameter name is number
    mutating func setNumber(_ number: Double) {
        // self.number is the global variable "private var number" where number is local variable in the argument in the "setNumber(_ number:Double)"
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "AC": return 0
            case  "+/-": return n * -1
            case "%": return n / 100
            case "=": return performTwoNumberCalculation(n2: n)
            default: intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("the operation passed in doe snot mathces any of the cases.")
            }
        }
        return nil
    }
    
}
