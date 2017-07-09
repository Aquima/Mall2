//
//  RegisterViewController.swift
//  Mall
//
//  Created by Nara on 3/2/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
import Firebase
protocol RegisterViewControllerDelegate {
    func completedRegister(currentUser:Person)
}
enum inputRegisterType{
    case keyName
    case keyDocument
    case keyEmail
    case keyPassword
}
class RegisterViewController: UIViewController, UITextFieldDelegate {

    var delegate:RegisterViewControllerDelegate?
    var currentUser: Person!
    let screenSize: CGRect = UIScreen.main.bounds
    
    var inputList:[UITextField] = []
    
    @IBOutlet weak var linePassword: UIView!
    @IBOutlet weak var lineDocument: UIView!
    @IBOutlet weak var lineMail: UIView!
    @IBOutlet weak var lineName: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var btnCreated: UIButton!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var txtDocument: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
     //   drawBody()
        //let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        /*
        let btnClose = UIButton()
        btnClose.frame =  CGRect(x:10*valuePro, y: 10*valuePro, width: 40*valuePro, height: 40*valuePro)
        btnClose.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        //btnClose.layer.borderColor = UIColor.init(hexString: "4f1563")
        btnClose.layer.cornerRadius = btnClose.frame.size.height/2
        btnClose.backgroundColor = UIColor.clear
        btnClose.setTitle("X", for: UIControlState.normal)
        btnClose.setTitleColor(UIColor.init(hexString: "4f1563"), for: UIControlState.normal)
        self.view.addSubview(btnClose)*/
        
    }
    override func viewDidAppear(_ animated: Bool) {
        drawBody()
    }
    func drawBody()  {
        view.backgroundColor = UIColor.init(hexString: "f2f2f2")
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        imgLogo.frame = CGRect(x:(screenSize.width-150*valuePro)/2, y: 56*valuePro, width: 150*valuePro, height: 60*valuePro)
        
     
        txtName.tag = inputRegisterType.keyName.hashValue
        txtDocument.tag = inputRegisterType.keyDocument.hashValue
        txtMail.tag = inputRegisterType.keyEmail.hashValue
        txtPassword.tag = inputRegisterType.keyPassword.hashValue
        
        inputList.append(txtName)
        inputList.append(txtDocument)
        inputList.append(txtMail)
        inputList.append(txtPassword)
        
        txtName.delegate = self
        txtDocument.delegate = self
        txtMail.delegate = self
        txtPassword.delegate = self
        
        lineName.frame =  CGRect(x:(screenSize.width-272*valuePro)/2, y: 188*valuePro, width: 272*valuePro, height: 1*valuePro)
        lineName.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        lineDocument.frame =  CGRect(x:(screenSize.width-272*valuePro)/2, y: 237*valuePro, width: 272*valuePro, height: 1*valuePro)
        lineDocument.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        lineMail.frame =  CGRect(x:(screenSize.width-272*valuePro)/2, y: 286*valuePro, width: 272*valuePro, height: 1*valuePro)
        lineMail.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        linePassword.frame =  CGRect(x:(screenSize.width-272*valuePro)/2, y: 335*valuePro, width: 272*valuePro, height: 1*valuePro)
        linePassword.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        lblTerms.frame = CGRect(x: (screenSize.width-272*valuePro)/2, y: 350*valuePro, width: 272*valuePro, height: 46*valuePro)
        
     //   btnCreated.frame = CGRect(x:(screenSize.width-285*valuePro)/2, y: 408.91*valuePro, width: 285*valuePro, height: 44*valuePro)
        btnCreated.layer.cornerRadius = btnCreated.frame.size.height/2
        btnCreated.addTarget(self, action: #selector(self.registerManual(_:)), for: UIControlEvents.touchUpInside)
        
        let imageIcon = UIImageView(image: #imageLiteral(resourceName: "UserIcon"))
        imageIcon.frame = CGRect(x:32.938*valuePro, y: 148.089*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon)
        
        let imageIcon1 = UIImageView(image: #imageLiteral(resourceName: "UserIcon"))
        imageIcon1.frame = CGRect(x:32.938*valuePro, y: 202.406*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon1)

        let imageIcon2 = UIImageView(image: #imageLiteral(resourceName: "UserIcon"))
        imageIcon2.frame = CGRect(x:32.938*valuePro, y: 251.406*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon2)
        
        let imageIcon3 = UIImageView(image: #imageLiteral(resourceName: "PasswordIcon"))
        imageIcon3.frame = CGRect(x:32.938*valuePro, y: 300.406*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon3)
        
        self.txtName.frame = CGRect(x:71.51*valuePro, y: 148.089*valuePro, width: 200*valuePro, height: 30*valuePro)
      //  self.txtName.backgroundColor = UIColor.red
        self.txtDocument.frame = CGRect(x:71.51*valuePro, y: 202.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        self.txtMail.frame = CGRect(x:71.51*valuePro, y: 251.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        self.txtPassword.frame = CGRect(x:71.51*valuePro, y: 300.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        
    }
   
    // MARK: - UITextField
   
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case inputRegisterType.keyName.hashValue:
           
            let inputText:UITextField = self.inputList[inputRegisterType.keyDocument.hashValue]
            inputText.becomeFirstResponder()
            
            break
        case inputRegisterType.keyDocument.hashValue:
            
            let inputText:UITextField = self.inputList[inputRegisterType.keyEmail.hashValue]
            inputText.becomeFirstResponder()
            
            break
        case inputRegisterType.keyEmail.hashValue:
            
            let inputText:UITextField = self.inputList[inputRegisterType.keyPassword.hashValue]
            inputText.becomeFirstResponder()
            
            break
        case inputRegisterType.keyPassword.hashValue:
    
            textField.resignFirstResponder()
            break
        default:
            return true
        }
        return true
    }
    
    // MARK: - Action
    func showAlertError(message:String){
        let uiAlert = UIAlertController(title: "Real Plaza", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
        }))
        self.present(uiAlert, animated: true, completion: nil)
        
    }
    @IBAction func tapResign(_ sender: Any) {
        for inputUX in self.inputList {
            let inputTxt = inputUX
            inputTxt.resignFirstResponder()
        }
    }
    func registerManual(_ sender: UIButton){
        //        activityIndicatorView.startAnimating()
                let inputTextMail:UITextField = self.inputList[inputRegisterType.keyEmail.hashValue]
                let inputTextPassword:UITextField = self.inputList[inputRegisterType.keyPassword.hashValue]
               // self.btnRegis.isHidden = true
        
                if inputTextMail.text != "" && inputTextPassword.text != "" {
        
                    let email = inputTextMail.text
                    let password = inputTextPassword.text
        
                    Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user: User?, error) in
        
                     //   self.activityIndicatorView.stopAnimating()
                       // self.btnRegis.isHidden = false
                        if error == nil {
                            //cuando creo delegar succes completed y  crear email y password al currentUser
                            
                            self.currentUser.password = self.inputList[inputRegisterType.keyPassword.hashValue].text
                            self.currentUser.email = self.inputList[inputRegisterType.keyEmail.hashValue].text
                            self.currentUser.name = self.inputList[inputRegisterType.keyName.hashValue].text
                            self.currentUser.document = self.inputList[inputRegisterType.keyDocument.hashValue].text
                            //llamamos a un protocolo
                            self.delegate?.completedRegister(currentUser: self.currentUser)
                            self.dismiss(animated: true, completion: {
                                  print("register successful")
                            })
                          
                        }else{
                            if let errCode = AuthErrorCode(rawValue: error!._code) {
                                
                                switch errCode {
                                case .invalidEmail:
                                    print("invalid email")
                                    self.showAlertError(message: "El Correo Electronico no es valido")
                                case .wrongPassword:
                                    print("invalid password")
                                    self.showAlertError(message: "Contraseña incorrecta")
                                    //                    case .error:
                                    //                        print("invalid password")
                                //
                                default:
                                    print("Other error!")
                                    self.showAlertError(message: "Verifique los datos ingresados")
                                }
                                
                            }

                            print("register failure:\nerror:\(error.debugDescription)")
                        }
                    })
                    
                    
                }else{
                    
                  //  sender.isHidden = false
                }

    }

}
