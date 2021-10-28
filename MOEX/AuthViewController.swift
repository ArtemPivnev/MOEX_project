//
//  AuthViewController.swift
//  MOEX
//
//  Created by Артем Пивнев on 28.09.2021.
//

import UIKit
import Firebase
class AuthViewController: UIViewController {
    var singup:Bool = true{
        willSet{
            if newValue{
                tittleLabel.text = "Регистрация"
                nameField.isHidden = false
                enterButton.setTitle("Войти", for: .normal)
            }
            else{
                tittleLabel.text = "Вход"
                nameField.isHidden = true
                enterButton.setTitle("Регистрация", for: .normal)
            }
        }
    }
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        Auth.auth().signOut()
    }
    
    @IBAction func switchLogin(_ sender: UIButton) {
        singup = !singup
        
    }
    
    func  showAlert(){
        let Alert = UIAlertController(title: "Ошибка", message: "Заполните поле", preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(Alert, animated: true, completion: nil)
    }
}
extension AuthViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            let name = nameField.text!
            let email = EmailField.text!
            let password = passwordField.text!
            
        
            if(singup){
                if (!name.isEmpty && !email.isEmpty && !password.isEmpty){
                    Auth.auth().createUser(withEmail: email, password: password){(result, error) in
                        if error == nil{
                            if let result = result{
                                print(result.user.uid)
                                
                            }
                        }
                    }
                }else{
                    
                }
                
            }
            if ( !email.isEmpty && !password.isEmpty){
                
                
            }else{
                showAlert()
            }
            return true
        }
}
    

