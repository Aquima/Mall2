//
//  RegisterViewController.swift
//  Mall
//
//  Created by Nara on 3/2/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
enum inputRegisterType{
    case keyName
    case keyDocument
    case keyEmail
    case keyPassword
}
class RegisterViewController: UIViewController, UITextFieldDelegate {
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
        drawBody()
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
    
    func drawBody()  {
        view.backgroundColor = UIColor.init(hexString: "f2f2f2")
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        imgLogo.frame = CGRect(x:(320*valuePro-150*valuePro)/2, y: 56*valuePro, width: 150*valuePro, height: 60*valuePro)
        
        txtName.frame = CGRect(x:71.51*valuePro, y: 148.089*valuePro, width: 200*valuePro, height: 30*valuePro)
        txtDocument.frame = CGRect(x:71.51*valuePro, y: 202.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        txtMail.frame = CGRect(x:71.51*valuePro, y: 251.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        txtPassword.frame = CGRect(x:71.51*valuePro, y: 300.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        
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
        
        btnCreated.frame = CGRect(x:(self.view.frame.size.width-285*valuePro)/2, y: 408.91*valuePro, width: 285*valuePro, height: 44*valuePro)
        btnCreated.layer.cornerRadius = btnCreated.frame.size.height/2
        
        lineName.frame =  CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 188*valuePro, width: 272*valuePro, height: 1*valuePro)
        lineName.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        lineDocument.frame =  CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 237*valuePro, width: 272*valuePro, height: 1*valuePro)
        lineDocument.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        lineMail.frame =  CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 286*valuePro, width: 272*valuePro, height: 1*valuePro)
        lineMail.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        linePassword.frame =  CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 335*valuePro, width: 272*valuePro, height: 1*valuePro)
        linePassword.backgroundColor = UIColor.init(hexString: "b3b3b3")
        
        lblTerms.frame = CGRect(x: (screenSize.width-272*valuePro)/2, y: 350*valuePro, width: 272*valuePro, height: 46*valuePro)
        
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
    

    @IBAction func tapResign(_ sender: Any) {
        for inputUX in self.inputList {
            let inputTxt = inputUX
            inputTxt.resignFirstResponder()
        }
    }
}
