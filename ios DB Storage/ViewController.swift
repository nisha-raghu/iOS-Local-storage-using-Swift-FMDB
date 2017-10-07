//
//  ViewController.swift
//  ios DB Storage
//
//  Created by Nisha Raghu on 16/09/17.
//  Copyright © 2017 Nisha Raghu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contactNameText: UITextField!
    @IBOutlet weak var localtionText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var SaveBtn: UIButton!
    @IBOutlet weak var CancelBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveBtn.layer.borderWidth = 1
        SaveBtn.layer.cornerRadius = 5
        CancelBtn.layer.borderWidth = 1
        CancelBtn.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addressText.borderStyle = UITextBorderStyle.roundedRect
    }

    @IBAction func SaveAction(_ sender: Any) {
        let contactInfo: Contactlist = Contactlist()
        contactInfo.Name = contactNameText.text!
        contactInfo.MobileNo = phoneText.text!
        contactInfo.location = localtionText.text!
        contactInfo.address = addressText.text!
        contactInfo.Email = emailText.text!
        
        if(!(contactInfo.Name.isEmpty || contactInfo.MobileNo.isEmpty || contactInfo.location.isEmpty || contactInfo.address.isEmpty || contactInfo.Email.isEmpty))
        {   let isInserted = ModelManager.getInstance().addContactData(contactInfo: contactInfo)
            if isInserted {
                Util.invokeAlertMethod(strTitle: "", strBody: "Record Inserted successfully.", delegate: nil)
            } else {
                Util.invokeAlertMethod(strTitle: "", strBody: "Error in inserting record.", delegate: nil)
            }
        }
        else{
            Util.invokeAlertMethod(strTitle: "", strBody: "One or more fields are empty", delegate: nil)
        }
    }
    
    @IBAction func CancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  

}

