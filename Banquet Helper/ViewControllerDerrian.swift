//
//  ViewController.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/5/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//

import UIKit

class ViewControllerDerrian: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var reTypePasswordField: UITextField!
    
    @IBOutlet weak var saveInfoButton: UIBarButtonItem!
    
    //@IBOutlet weak var FullNameLabel: UILabel!
    
   // @IBOutlet weak var emailLabel: UILabel!
    
    var userInfo: userAccount?
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nameField.delegate = self
        
        if let userInfo = userInfo{
            navigationItem.title = userInfo.name
            nameField.text = userInfo.name
            phoneField.text = userInfo.number
            emailField.text = userInfo.email
            passwordField.text = userInfo.password
            
        
        
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidUserInfo()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveInfoButton.enabled = false
    }

    func checkValidUserInfo() {
        // Disable the Save button if the text field is empty.
        let text = nameField.text ?? ""
        let text2 = emailField.text ?? ""
        let text3 = phoneField.text ?? ""
        let text4 = passwordField.text ?? ""
        
        saveInfoButton.enabled = !text.isEmpty && !text2.isEmpty && !text3.isEmpty &&  !text4.isEmpty
    }

    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveInfoButton === sender {
            let name = nameField.text ?? ""
            let email = emailField.text ?? ""
            let number = phoneField.text ?? ""
            let password = passwordField.text ?? ""
            
            // Set the meal to be passed to MealListTableViewController after the unwind segue.
            userInfo = userAccount(name: name, number: number, email: email, password: password )
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
        self.navigationController?.toolbarHidden = true
    }
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        var DestViewController : SignUpViewController = segue.destinationViewController as! SignUpViewController
        
        
    }*/


}

