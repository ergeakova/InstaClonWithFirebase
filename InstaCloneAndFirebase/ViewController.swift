//
//  ViewController.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 1.05.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    override var shouldAutorotate: Bool {return false}
    var utl = Utils()

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func singInClicked(_ sender: Any) {
        if (validateUserData(email: txtEmail.text!, Password: txtPassword.text!)) {
            Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (authdata, error) in
                if error != nil {
                    self.present(self.utl.showBasicAlert(tit: "Error", msg: error?.localizedDescription ?? "unable to login!"), animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
    }
    
    @IBAction func singUpClicked(_ sender: Any) {
        if (validateUserData(email: txtEmail.text!, Password: txtPassword.text!)) {
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (authData, error) in
                if error != nil {
                    self.present(self.utl.showBasicAlert(tit: "Error", msg: error?.localizedDescription ?? "user could not be created"), animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
    }
    
    func validateUserData(email: String, Password: String) -> Bool{
        if (utl.isEmptyString(value: email) && utl.isEmptyString(value: Password)) {
            return true
        }else{
            self.present(utl.showBasicAlert(tit:"Error",msg:"email and password cannot be empty"), animated: true, completion: nil)
            return false
        }
    }
}

