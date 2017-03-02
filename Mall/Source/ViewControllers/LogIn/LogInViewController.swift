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

    var btnRegis:UIButton!
    var btnLogeo:UIButton!
    var btnOlvidarPass:UIButton!
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
        let btnTapView = UIButton()
        btnTapView.frame = view.bounds
        btnTapView.addTarget(self, action: #selector(self.resignFirstResponderList), for: UIControlEvents.touchUpInside)
        view.addSubview(btnTapView)
        contentForm.frame =  CGRect(x: (self.view.frame.size.width-320*valuePro)/2, y: 255*valuePro, width: 320*valuePro, height: 314*valuePro)
        
        let btnTapForm = UIButton()
        btnTapForm.frame = contentForm.bounds
        btnTapForm.addTarget(self, action: #selector(self.resignFirstResponderList), for: UIControlEvents.touchUpInside)
        contentForm.addSubview(btnTapForm)
        
        
        let imageView = UIImageView(image:#imageLiteral(resourceName: "logoMall"))
        
        imageView.frame = CGRect(x: (contentForm.frame.size.width-200*valuePro)/2, y: 141.83*valuePro, width: 200*valuePro, height: 80*valuePro)
        self.view.addSubview(imageView)
        
        
        let viewContentTextField = UIView()
        viewContentTextField.frame = CGRect(x: (contentForm.frame.size.width-285.5*valuePro)/2, y: 0*valuePro, width: 285.5*valuePro, height: 102*valuePro)
        viewContentTextField.backgroundColor = UIColor.init(hexString: "ffffff")
        viewContentTextField.layer.cornerRadius = 20*valuePro
        viewContentTextField.layer.masksToBounds = true
        contentForm.addSubview(viewContentTextField)
        
        
        let view2 = UIView()
        view2.frame = CGRect(x: (viewContentTextField.frame.size.width-264*valuePro)/2, y: 51*valuePro, width: 264*valuePro, height: 1*valuePro)
        view2.backgroundColor = UIColor.init(hexString: "cccccc")
        viewContentTextField.addSubview(view2)
        
        let imageUser = UIImageView(image:#imageLiteral(resourceName: "UserIcon"))
        imageUser.frame = CGRect(x: 16*valuePro, y: 10.5*valuePro, width: 30*valuePro, height: 30*valuePro)
        viewContentTextField.addSubview(imageUser)
        
        let imagePass = UIImageView(image:#imageLiteral(resourceName: "PasswordIcon"))
        imagePass.frame = CGRect(x: 16*valuePro, y: 61.5*valuePro, width: 30*valuePro, height: 30*valuePro)
        viewContentTextField.addSubview(imagePass)
        
        
        let inputMail = UITextField()
        inputMail.frame =  CGRect(x: 51.451*valuePro, y: 10.5*valuePro, width: 200*valuePro, height: 30*valuePro)
        inputMail.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputMail.textColor = UIColor.init(hexString: "303030")
        inputMail.backgroundColor = UIColor.clear
        inputMail.placeholder = "Correo Electronico"
        inputMail.textAlignment = NSTextAlignment.center
        inputMail.tag = inputType.keyMail.hashValue;
        inputMail.keyboardType = UIKeyboardType.emailAddress
        inputMail.returnKeyType = UIReturnKeyType.continue
        inputMail.clearButtonMode = .whileEditing
        inputMail.delegate = self
        viewContentTextField.addSubview(inputMail)
        
        inputList.append(inputMail)
        
        let inputPassword = UITextField()
        inputPassword.frame =  CGRect(x: 51.451*valuePro, y: 61.5*valuePro, width: 200*valuePro, height: 30*valuePro)
        inputPassword.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputPassword.textColor = UIColor.init(hexString: "303030")
        inputPassword.backgroundColor = UIColor.clear
        inputPassword.placeholder = "Contraseña"
        inputPassword.textAlignment = NSTextAlignment.center
        inputPassword.isSecureTextEntry = true
        inputPassword.tag = inputType.keyPassword.hashValue;
        inputPassword.clearButtonMode = .whileEditing
        inputPassword.delegate = self
        inputPassword.keyboardType = UIKeyboardType.default
        inputPassword.returnKeyType = UIReturnKeyType.done
 
        //     inputMail.text = "raul.quispe@live.com"
        //   inputPassword.text = "123456"
        viewContentTextField.addSubview(inputPassword)
        
        inputList.append(inputPassword)
 
        
        
        self.btnLogeo = UIButton()
        self.btnLogeo.frame =  CGRect(x: (self.view.frame.size.width-285*valuePro)/2, y: 118*valuePro, width: 285*valuePro, height: 44*valuePro)
        self.btnLogeo.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        self.btnLogeo.setTitle("Iniciar Sesión",for: UIControlState.normal)
        self.btnLogeo.layer.borderColor = UIColor.black.cgColor
        self.btnLogeo.setTitleColor(UIColor.init(hexString: "4f1563"), for: .normal)
        self.btnLogeo.layer.cornerRadius = btnLogeo.frame.size.height/2
        self.btnLogeo.backgroundColor = UIColor.init(hexString: "fffeff")
        self.btnLogeo.addTarget(self, action: #selector(self.loginManualValidate), for: UIControlEvents.touchUpInside)
        
        let frame =  CGRect(x: btnLogeo.frame.origin.x + (btnLogeo.frame.size.width-35*valuePro)/2, y:  btnLogeo.frame.origin.y + (btnLogeo.frame.size.height-35*valuePro)/2, width:35*valuePro, height: 35*valuePro)
        activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                   type: NVActivityIndicatorType(rawValue:1)!)
        activityIndicatorView.color = UIColor.init(hexString: "00AFF1")
        activityIndicatorView.startAnimating()
        contentForm.addSubview(activityIndicatorView)
        contentForm.addSubview(self.btnLogeo)
        
        
        
        self.btnRegis = UIButton()
        self.btnRegis.frame =  CGRect(x: (self.view.frame.size.width-285*valuePro)/2, y: 172.57*valuePro, width: 285*valuePro, height: 44*valuePro)
        self.btnRegis.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        self.btnRegis.setTitle("Registrate",for: UIControlState.normal)
        self.btnRegis.layer.borderColor = UIColor.black.cgColor
        self.btnRegis.layer.cornerRadius = btnRegis.frame.size.height/2
        self.btnRegis.backgroundColor = UIColor.init(hexString: "00AFF1")
        self.btnRegis.setTitleColor(UIColor.white, for: .normal)
        self.btnRegis.addTarget(self, action: #selector(self.loginManualValidate), for: UIControlEvents.touchUpInside)
        
        let frame1 =  CGRect(x: btnRegis.frame.origin.x + (btnRegis.frame.size.width-35*valuePro)/2, y:  btnRegis.frame.origin.y + (btnRegis.frame.size.height-35*valuePro)/2, width:35*valuePro, height: 35*valuePro)
        activityIndicatorView = NVActivityIndicatorView(frame: frame1,
                                                        type: NVActivityIndicatorType(rawValue:1)!)
        activityIndicatorView.color = UIColor.init(hexString: "00AFF1")
        activityIndicatorView.startAnimating()
        contentForm.addSubview(activityIndicatorView)
        
        contentForm.addSubview(self.btnRegis)
        
        
        btnOlvidarPass = UIButton()
        self.btnOlvidarPass.frame =  CGRect(x: (self.view.frame.size.width-150*valuePro)/2, y: 229.78*valuePro, width: 150*valuePro, height: 14.56*valuePro)
        self.btnOlvidarPass.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        self.btnOlvidarPass.setTitle("¿Olvidaste tu contraseña?",for: UIControlState.normal)
        self.btnOlvidarPass.backgroundColor = UIColor.init(hexString: "4f1563")
        self.btnOlvidarPass.setTitleColor(UIColor.white, for: .normal)
        contentForm.addSubview(self.btnOlvidarPass)
        
        
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
            self.contentForm.contentOffset.y = 0*valuePro
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
            self.contentForm.contentOffset.y = 0*valuePro
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
        self.btnLogeo.isHidden = true
        
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
                                self.btnLogeo.isHidden = false
                                if error == nil {
                
                                    print("signIn successful")
                                }else{
                
                                    print("signIn failure:\nerror:\(error.debugDescription)")
                                }
                            })


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
