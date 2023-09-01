//
//  ViewController.swift
//  EdwinCalculatorProyect
//
//  Created by Edwin Mejia on 29/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCalculatorArea: UILabel!
    @IBOutlet weak var lblCalcResume: UILabel!
    
    var txtNumber1 = ""
    var txtNumber2 = ""
    var result = 0.0
    var operation = ""
    var error = "error"
    var calculatorArea = ""
    var calcResume = ""
    var calcToDo = (multiplication: "multiplication", divition:"divition", percent:"percent", addition:"addition", subtraction:"substraction")
   
    
    lazy var calc = CalculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        print("btn del")
        clearCalculatorArea()
        clearCalResume()
        lblCalculatorArea.text = "0"
    }
    
    @IBAction func btnMinusSign(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            if let number = lblCalculatorArea.text{
                lblCalculatorArea.text = "-\(number)"
                lblCalcResume.text = "-\(number)"
                calcResume = "-\(number)"
            }
        }
    }
    
    @IBAction func btnPercent(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            if let number1 = lblCalculatorArea.text{
                /*if lblCalcResume.text != nil{
                    updateCalcResume(with: number1)
                }else {}*/
                updateCalcResume(with: "%")
                txtNumber1 = number1
                clearCalculatorArea()
                operation = calcToDo.percent
            }
        }
        
    }
    
    @IBAction func btnDivision(_ sender: UIButton) {
        if isLblCalcUpdatable() {
            if let number1 = lblCalculatorArea.text{
                updateCalcResume(with: "/")
                txtNumber1 = number1
                clearCalculatorArea()
                operation = calcToDo.divition
            }
        }
    }
    
    @IBAction func btn7(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "7")
            updateCalculatorArea(with: "7")
        }
    }
    
    @IBAction func btn8(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "8")
            updateCalculatorArea(with: "8")
        }
    }
    
    @IBAction func btn9(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "9")
            updateCalculatorArea(with:"9")
        }
    }
    
    @IBAction func btnMultiplication(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            if let number1 = lblCalculatorArea.text{
                updateCalcResume(with: "X")
                txtNumber1 = number1
                clearCalculatorArea()
                operation = calcToDo.multiplication
            }
        }
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "4")
            updateCalculatorArea(with: "4")
        }
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "5")
            updateCalculatorArea(with: "5")
        }
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "6")
            updateCalculatorArea(with: "6")
        }
    }
    
    @IBAction func btnSubtraction(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            if let number1 = lblCalculatorArea.text{
                updateCalcResume(with: "-")
                txtNumber1 = number1
                clearCalculatorArea()
                operation = calcToDo.subtraction
            }
        }
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "1")
            updateCalculatorArea(with: "1")
        }
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "2")
            updateCalculatorArea(with: "2")
        }
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        if isLblCalcUpdatable(){
            updateCalcResume(with: "3")
            updateCalculatorArea(with: "3")
        }
    }
    
    
    @IBAction func btnAddition(_ sender: UIButton) {
        if isLblCalcUpdatable (){
            if let number1 = lblCalculatorArea.text{
                updateCalcResume(with: "+")
                txtNumber1 = number1
                clearCalculatorArea()
                operation = calcToDo.addition
            }
        }
    }
    
    @IBAction func btnZero(_ sender: UIButton) {
        updateCalcResume(with: "0")
        updateCalculatorArea(with: "0")
    }
    
    @IBAction func Btn2Zeros(_ sender: UIButton) {
        updateCalcResume(with: "00")
        updateCalculatorArea(with: "00")
    }
    
    @IBAction func btnComa(_ sender: UIButton) {
        updateCalcResume(with: ".")
        updateCalculatorArea(with: ".")
    }
    
    @IBAction func btnResult(_ sender: UIButton) {
        print("btn =")
        calcResume = ""
        lblCalcResume.text = ""
        if let number2 = lblCalculatorArea.text {
            txtNumber2 = number2
            calculatorArea = ""
            if txtNumber1.count != 0 && txtNumber2.count != 0 {
                switch operation {
                    case calcToDo.addition:
                        result = calc.addition(Double(txtNumber1)!, Double(txtNumber2)!)
                        setResult(with: String(result))
                    case calcToDo.subtraction:
                        result = calc.substracion(Double(txtNumber1)!, Double(txtNumber2)!)
                        setResult(with: String(result))
                    case calcToDo.multiplication:
                        result = calc.multiplication(Double(txtNumber1)!, Double(txtNumber2)!)
                        setResult(with: String(result))
                    case calcToDo.divition:
                        if txtNumber2 != "0"{
                            result = calc.divition(Double(txtNumber1)!, Double(txtNumber2)!)
                            setResult(with: String(result))
                        }else {
                            print("Error divition /0")
                            lblCalculatorArea.text = "Error"
                            updateCalcResume(with: "Error divition / 0")
                        }
                    case calcToDo.percent:
                        result = calc.percent(Double(txtNumber1)!, Double(txtNumber2)!)
                        setResult(with: String(result))
                    default:
                        print("")
                }
            }else {
                lblCalculatorArea.text = "Error"
            }
        }else{
            lblCalculatorArea.text = "Error"
        }
    }
    func setResult (with txt: String){
        lblCalculatorArea.text = txt
        txtNumber1 = txt
        lblCalcResume.text = txt
        calcResume = txt
    }
    
    func updateCalculatorArea (with txt:String){
        calculatorArea = calculatorArea + txt
        lblCalculatorArea.text = calculatorArea
    }
    func updateCalcResume (with txt:String){
        calcResume = calcResume + txt
        lblCalcResume.text = calcResume
    }
    func clearCalculatorArea () {
        lblCalculatorArea.text = ""
        calculatorArea = ""
    }
    
    func clearTxtNumbers(){
        txtNumber1 = ""
        txtNumber2 = ""
    }
       
    func clearCalResume(){
        calcResume = ""
        lblCalcResume.text = ""
    }
    
    func isLblCalcUpdatable ()-> Bool{
        var numberOfcharacter = 0
        let error = "Error"
        var txtLblCalcArea = ""
        if let txt = lblCalculatorArea.text {
            numberOfcharacter = txt.count
        }
        if let txt2 = lblCalculatorArea.text {
            txtLblCalcArea = txt2
        }
        if numberOfcharacter < 10 && txtLblCalcArea != error {
            return true
        }else{
            return false
            
        }
    }
}

