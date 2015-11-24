//
//  SignUpController.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/10/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//

//
//  SignInController.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/10/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//



import Foundation
import UIKit

class signUpController: UIViewController, UITextFieldDelegate
{
    var customerModel = CustomerModel()
    var pass = 0
    
    var name:String = "Jeff Winger"
    var email:String = ""
    var phone:String = ""
    var password:String = ""
    var passName:String = "Testing"
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var reTypeField: UITextField!
    
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    //func isValidNumber
    
    
    @IBAction func signUpButton(sender: UIButton)
    {
        /*
        if (textField.text.isEmpty) {
        let alert = UIAlertView()
        alert.title = "No Text"
        alert.message = "Please Enter Text In The Box"
        alert.addButtonWithTitle("Ok")
        alert.show()
        }
        
        */
        if( nameField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No Name Entered"
            alert.message = "Please Enter Your Name"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else if( emailField.text!.isEmpty)
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
        else if( phoneField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No phone Entered"
            alert.message = "Please Enter Your Phone Number"
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
        else if( reTypeField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "Only one Password detected"
            alert.message = "Please Re-enter Your password"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else if( passField.text! != reTypeField.text)
        {
            let alert = UIAlertView()
            alert.title = "Passwords Do Not Match"
            alert.message = "Please Re-Enter your Password"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
            
        else
        {
            let customer = CustomerModel(
                firstname: nameField.text!,
                lastName: nameField.text!,
                loginId: emailField.text!,
                loginPassword: passField.text!,
                streetAddress: "123 Fake Dr",
                city: "Dallas",
                state: "TX",
                zipCode: 75207)
            //nameLabel.text = nameField.text!
            //emailLabel.text = emailField.text!
            //phoneLabel.text = phoneField.text!
            //passLabel.text = passField.text!
            //reTypeLabel.text = reTypeField.text!
            print(customer.setNewCustomerUrlString())
            print(customer.setNewCustomerJsonString())
            let repository = HotelRepository()
            repository.GetSpecific(Table.Name.Customers, parameters: customer.checkExistingCustomerLoginIdJsonParameters(customer.LoginId!)){
                (json: NSDictionary ,exists: Bool) in
                
                if(!exists){
                    
                    repository.addToDataBase(customer.setNewCustomerJsonString(), urlString: customer.setNewCustomerUrlString()){
                        (complete : Bool) in
                        if(complete){
                            self.customerModel = customer
                            dispatch_async( dispatch_get_main_queue(), {
                                self.performSegueWithIdentifier("signedUp", sender: nil)
                            })
                        }
                            
                        else{
                            dispatch_async( dispatch_get_main_queue(), {
                                let alert = UIAlertView()
                                alert.title = "Connection Failed"
                                alert.message = "Could not connect at this time, please try again later."
                                alert.addButtonWithTitle("Ok")
                                alert.show()
                                
                            })
                        }
                        
                    }
                    
                }
                else{
                    dispatch_async( dispatch_get_main_queue(), {
                        let alert = UIAlertView()
                        alert.title = "Unable to Add at this Time"
                        alert.message = "Login Id already exists, please try to sign in."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                        
                    })
                    
                }
            }
            
            
            
            
        }
    }
    
    @IBAction func toSignIn(sender: AnyObject)
    {
        self.performSegueWithIdentifier("ToSignIn", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "signedUp")
        {
            let secondVC: MenuViewController = segue.destinationViewController as! MenuViewController
            secondVC.email = emailField.text!
            secondVC.name = nameField.text!
            secondVC.phone = phoneField.text!
            secondVC.password = passField.text!
            secondVC.customerModel = self.customerModel
        }
        if(segue.identifier == "ToSignIn")
        {
            let secondVC: signInController = segue.destinationViewController as! signInController
            secondVC.email = emailField.text!
            //secondVC.name = nameField.text!
            // secondVC.phone = phoneField.text!
            secondVC.password = passField.text!
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailField.text = email
        
        passField.text = password
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController?.navigationBarHidden = true
    }
    /*override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
    <#code#>
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
}