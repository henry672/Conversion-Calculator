//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Henry Asare on 12/17/17.
//  Copyright © 2017 Henry Asare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var state = "fToC"
    var sign = "-"

    @IBOutlet weak var outputField: UITextField!
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func clear(_ sender: UIButton) {
        inputField.text = ""
        outputField.text = ""
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        inputField.text = inputField.text! + String(sender.tag - 1)
        numberOnScreen = Double(inputField.text!)!
        conversion(numberOnScreen, state)
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        inputField.text = inputField.text! + sender.currentTitle!
    }
    
    @IBAction func sign(_ sender: Any) {
        if sign == "-" {
            inputField.text = "-" + inputField.text!
            outputField.text = "-" + outputField.text!
            sign = "+"
        }
    }
    
    func conversion(_ number:Double, _ state:String) {
        switch state {
            case "fToC":
                let celcius:Double = (number - 32) * (5/9)
                outputField.text = String(floor(celcius*100)/100) + " C"
                
                break
            case "cToF":
                let fahrenheit = (number * (9/5) + 32)
                outputField.text = String(floor(fahrenheit*100)/100) + " F"
                break
            case "mToK":
                let kilos = number * 1.6
                outputField.text = (String(floor(kilos))) + " km"
                break
            case "kToM":
                let miles = number * 0.621
                outputField.text = (String(floor(miles))) + " mi"
                break
            default:
                return
            }
        
    }
    
    @IBAction func converter(_ sender: Any) {
        let actionSheet = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                self.conversion(self.numberOnScreen, "fToC")
                self.state = "fToC"
        }))
        
        actionSheet.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
                self.conversion(self.numberOnScreen, "cToF")
                self.state = "cToF"
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion(self.numberOnScreen, "mToK")
            self.state = "mToK"
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
           self.conversion(self.numberOnScreen, "kToM")
            self.state = "kToM"
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
