//
//  SignUpViewController.swift
//  Finance
//
//  Created by Steven Solo on 11/23/22.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var appLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        appLogo.layer.cornerRadius = 40
        appLogo.layer.borderWidth = 2
        appLogo.layer.borderColor = UIColor.systemPink.cgColor
    }
    
    

    @IBAction func onSignup(_ sender: Any) {
            let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text

        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSignSegue", sender: nil)
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
