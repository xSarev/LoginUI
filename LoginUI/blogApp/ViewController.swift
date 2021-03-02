//
//  ViewController.swift
//  blogApp
//
//  Created by Dorin Sarev - (p) on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sliderField: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var justButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sliderField.text = "50"
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl){
        nameField.resignFirstResponder()
        passField.resignFirstResponder()
        phoneField.resignFirstResponder()
        emailField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderField.text = "\(progress)"
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            justButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            justButton.isHidden = false
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are you sure", message: nil, preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure", style: .destructive, handler: {
            action in
            let msg = self.nameField.text!.isEmpty ? "You are logged in" : "You are logged in \( self.nameField.text ?? "" )"
            let controller2 = UIAlertController(title: "Something was done", message: msg, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Done!", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller, animated: true, completion: nil)
    }
}

