//
//  LogInViewController.swift
//  Mall
//
//  Created by Raul Quispe on 2/28/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Firebase

enum inputType{
    case keyMail
    case keyPassword
}
class LogInViewController: UIViewController, UITextFieldDelegate {

    var btnEnter:UIButton!
    var inputList:[UITextField] = []
    let contentForm:UIScrollView = UIScrollView()
    var activityIndicatorView:NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRApp.configure()
        drawBody()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func drawBody(){
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.init(hexString: "4f1563")
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        contentForm.frame =  CGRect(x: (self.view.frame.size.width-320*valuePro)/2, y: 255*valuePro, width: 320*valuePro, height: 314*valuePro)
        
        let btnTapForm = UIButton()
        btnTapForm.frame = contentForm.bounds
        btnTapForm.addTarget(self, action: #selector(self.resignFirstResponderList), for: UIControlEvents.touchUpInside)
        contentForm.addSubview(btnTapForm)
        
        let inputMail = UITextField()
        inputMail.frame =  CGRect(x: (contentForm.frame.size.width-290*valuePro)/2, y: 0*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputMail.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputMail.textColor = UIColor.init(hexString: "303030")
        inputMail.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputMail.placeholder = "Correo Electronico"
        inputMail.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputMail.layer.borderWidth = 1
        inputMail.textAlignment = NSTextAlignment.center
        inputMail.layer.cornerRadius = inputMail.frame.size.height/2
        inputMail.tag = inputType.keyMail.hashValue;
        inputMail.keyboardType = UIKeyboardType.emailAddress
        inputMail.returnKeyType = UIReturnKeyType.continue
        inputMail.delegate = self
        contentForm.addSubview(inputMail)
        
        inputList.append(inputMail)
        
        let inputPassword = UITextField()
        inputPassword.frame =  CGRect(x: (contentForm.frame.size.width-290*valuePro)/2, y: 52*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputPassword.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputPassword.textColor = UIColor.init(hexString: "303030")
        inputPassword.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputPassword.placeholder = "Contraseña"
        inputPassword.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputPassword.layer.borderWidth = 1
        inputPassword.textAlignment = NSTextAlignment.center
        inputPassword.layer.cornerRadius = inputPassword.frame.size.height/2
        inputPassword.isSecureTextEntry = true
        inputPassword.tag = inputType.keyPassword.hashValue;
        inputPassword.delegate = self
        inputPassword.keyboardType = UIKeyboardType.default
        inputPassword.returnKeyType = UIReturnKeyType.done
        
        //     inputMail.text = "raul@gmail.com"
        //   inputPassword.text = "123456"
        contentForm.addSubview(inputPassword)
        
        inputList.append(inputPassword)
        
        self.btnEnter = UIButton()
        self.btnEnter.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 52*4*valuePro, width: 290*valuePro, height: 35*valuePro)
        self.btnEnter.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        self.btnEnter.setTitle("Iniciar Sesión",for: UIControlState.normal)
        self.btnEnter.layer.borderColor = UIColor.black.cgColor
        self.btnEnter.layer.cornerRadius = btnEnter.frame.size.height/2
        self.btnEnter.backgroundColor = UIColor.init(hexString: "00AFF1")
        self.btnEnter.setTitleColor(UIColor.white, for: .normal)
        self.btnEnter.addTarget(self, action: #selector(self.loginManualValidate), for: UIControlEvents.touchUpInside)
        
        let frame =  CGRect(x: btnEnter.frame.origin.x + (btnEnter.frame.size.width-35*valuePro)/2, y:  btnEnter.frame.origin.y + (btnEnter.frame.size.height-35*valuePro)/2, width:35*valuePro, height: 35*valuePro)
        activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                        type: NVActivityIndicatorType(rawValue:1)!)
        activityIndicatorView.color = UIColor.init(hexString: "00AFF1")
        activityIndicatorView.startAnimating()
        contentForm.addSubview(activityIndicatorView)
        
        contentForm.addSubview(self.btnEnter)
        
        view.addSubview(contentForm)

    }
    // MARK: - UITextField
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputType.keyMail.hashValue:
            self.contentForm.contentOffset.y = 0
            break
        case inputType.keyPassword.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro
            break
        default:
            return true
        }
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputType.keyMail.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro
            let inputText:UITextField = self.inputList[inputType.keyPassword.hashValue]
            inputText.becomeFirstResponder()
            break
        case inputType.keyPassword.hashValue:
            self.contentForm.contentOffset.y = 0
            textField.resignFirstResponder()
            break
        default:
            return true
        }
        return true
    }
    func resignFirstResponderList(){
        
        for inputUX in self.inputList {
            let inputTxt = inputUX
            inputTxt.resignFirstResponder()
        }
        self.contentForm.contentOffset.y = 0
    }
    func loginManualValidate(sender:UIButton)  {
    //call to firebase
        activityIndicatorView.startAnimating()
        let inputTextMail:UITextField = self.inputList[inputType.keyMail.hashValue]
        let inputTextPassword:UITextField = self.inputList[inputType.keyPassword.hashValue]
        
        
        if inputTextMail.text != "" && inputTextPassword.text != "" {
            
            let email = inputTextMail.text
            let password = inputTextPassword.text
       
//            FIRAuth.auth()?.createUser(withEmail: email!, password: password!, completion: { (user: FIRUser?, error) in
//                 self.activityIndicatorView.stopAnimating()
//                self.btnEnter.isHidden = false
//                if error == nil {
//                   
//                    print("registration successful")
//                }else{
//
//                    print("registration failure:\nerror:\(error.debugDescription)")
//                }
//            })
            FIRAuth.auth()?.signIn(withEmail: email!, password: password!, completion: { (user: FIRUser?, error) in
                                self.activityIndicatorView.stopAnimating()
                                self.btnEnter.isHidden = false
                                if error == nil {
                
                                    print("signIn successful")
                                }else{
                
                                    print("signIn failure:\nerror:\(error.debugDescription)")
                                }
                            })


            sender.isHidden = true
        }else{
            
            sender.isHidden = false
        }

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
