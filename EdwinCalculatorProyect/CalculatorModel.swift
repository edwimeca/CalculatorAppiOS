//
//  CalculatorModel.swift
//  EdwinCalculatorProyect
//
//  Created by Edwin Mejia on 29/08/23.
//

import Foundation

class CalculatorModel {
    /*var txtNumber1 = ""
    var txtNumber2 = ""
    var result = 0
    var txtresult = ""*/
    
    func addition  (_ num1:Double, _ num2:Double)->Double{
        return num1 + num2
    }
    func substracion (_ num1:Double, _ num2:Double)->Double{
        return num1 - num2
    }
    func multiplication (_ num1:Double, _ num2:Double)->Double{
        return num1 * num2
    }
    func divition (_ num1:Double, _ num2:Double)->Double{
       return num1 / num2
    }
    func percent (_ num1:Double, _ num2:Double)->Double{
        return (num1 * num2) / 100
    }
}
