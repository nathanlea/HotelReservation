//
//  SignInController.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/10/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//

import Foundation
import UIKit

class signInController: UIViewController, UITextFieldDelegate
{
    
    var name:String = "Britta Perry"
    var email:String = ""
    var phone:String = ""
    var password:String = ""
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    //func isValidNumber
    
    
    @IBAction func toSignUp(sender: UIButton) {
        self.performSegueWithIdentifier("ToSignUp", sender: nil)
    }
    @IBAction func SignInButton(sender: UIButton) {
        
        /*
        if (textField.text.isEmpty) {
        let alert = UIAlertView()
        alert.title = "No Text"
        alert.message = "Please Enter Text In The Box"
        alert.addButtonWithTitle("Ok")
        alert.show()
        }
        
        */
        if( emailField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No Email Entered"
            alert.message = "Please Enter Your Email address"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else if(!isValidEmail(emailField.text!))
        {
            let alert = UIAlertView()
            alert.title = "Not a Vaild Email"
            alert.message = "Please Enter Your Email address"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
            
        else if( passField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No Password Entered"
            alert.message = "Please Enter Your password"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
            
            
        else
        {
            
            self.performSegueWithIdentifier("signedIn", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "signedIn")
        {
            let secondVC: MenuViewController = segue.destinationViewController as! MenuViewController
            secondVC.email = emailField.text!
            secondVC.password = passField.text!
        }
        if(segue.identifier == "ToSignUp")
        {
            let secondVC: signUpController = segue.destinationViewController as! signUpController
            secondVC.email = emailField.text!
            
            secondVC.password = passField.text!
            
        }
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        emailField.text = email
        
        passField.text = password
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
}