//
//  RegisterViewController.swift
//  Mall
//
//  Created by Nara on 3/2/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

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
    
    
    func drawBody(){
        view.backgroundColor = UIColor.init(hexString: "f2f2f2")
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logoMall"))
        imageView.frame = CGRect(x:(320*valuePro-136.30*valuePro)/2, y: 64.388*valuePro, width: 136.30*valuePro, height: 41.61*valuePro)
        imageView.backgroundColor = UIColor.init(hexString: "4f1563")
        self.view.addSubview(imageView)
        
        //content input date
        let imageIcon = UIImageView(image: #imageLiteral(resourceName: "UserIcon"))
        imageIcon.frame = CGRect(x:32.938*valuePro, y: 148.089*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon)
        let inputName = UITextField()
        inputName.frame = CGRect(x:71.51*valuePro, y: 148.089*valuePro, width: 200*valuePro, height: 30*valuePro)
        inputName.backgroundColor = UIColor.init(hexString: "f2f2f2")
        inputName.placeholder = "Nombre"
        inputName.textColor = UIColor.init(hexString: "4f1563")
        inputName.textAlignment = NSTextAlignment.center
        self.view.addSubview(inputName)
        let viewLine = UIView()
        viewLine.frame = CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 192*valuePro, width: 272*valuePro, height: 1*valuePro)
        viewLine.backgroundColor = UIColor.init(hexString: "cbc9cb")
        self.view.addSubview(viewLine)
        
        
        let imageIcon1 = UIImageView(image: #imageLiteral(resourceName: "UserIcon"))
        imageIcon1.frame = CGRect(x:32.938*valuePro, y: 202.406*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon1)
        let inputDNI = UITextField()
        inputDNI.frame = CGRect(x:71.51*valuePro, y: 202.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        inputDNI.backgroundColor = UIColor.init(hexString: "f2f2f2")
        inputDNI.placeholder = "DNI"
        inputDNI.textColor = UIColor.init(hexString: "4f1563")
        inputDNI.textAlignment = NSTextAlignment.center
        self.view.addSubview(inputDNI)
        let viewLine1 = UIView()
        viewLine1.frame = CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 242*valuePro, width: 272*valuePro, height: 1*valuePro)
        viewLine1.backgroundColor = UIColor.init(hexString: "cbc9cb")
        self.view.addSubview(viewLine1)
        
        
        let imageIcon2 = UIImageView(image: #imageLiteral(resourceName: "UserIcon"))
        imageIcon2.frame = CGRect(x:32.938*valuePro, y: 251.406*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon2)
        let inputCorreo = UITextField()
        inputCorreo.frame = CGRect(x:71.51*valuePro, y: 251.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        inputCorreo.backgroundColor = UIColor.init(hexString: "f2f2f2")
        inputCorreo.placeholder = "Correo"
        inputCorreo.textColor = UIColor.init(hexString: "4f1563")
        inputCorreo.textAlignment = NSTextAlignment.center
        self.view.addSubview(inputCorreo)
        let viewLine2 = UIView()
        viewLine2.frame = CGRect(x:(self.view.frame.size.width-272*valuePro)/2, y: 292*valuePro, width: 272*valuePro, height: 1*valuePro)
        viewLine2.backgroundColor = UIColor.init(hexString: "cbc9cb")
        self.view.addSubview(viewLine2)
        
        
        let imageIcon3 = UIImageView(image: #imageLiteral(resourceName: "PasswordIcon"))
        imageIcon3.frame = CGRect(x:32.938*valuePro, y: 300.406*valuePro, width: 30*valuePro, height: 30*valuePro)
        self.view.addSubview(imageIcon3)
        let inputPass = UITextField()
        inputPass.frame = CGRect(x:71.51*valuePro, y: 300.406*valuePro, width: 200*valuePro, height: 30*valuePro)
        inputPass.backgroundColor = UIColor.clear
        inputPass.placeholder = "Contraseña"
        inputPass.textColor = UIColor.init(hexString: "4f1563")
        inputPass.textAlignment = NSTextAlignment.center
        self.view.addSubview(inputPass)
        
        
        
        
        let btnRegister = UIButton()
        btnRegister.frame = CGRect(x:(self.view.frame.size.width-285*valuePro)/2, y: 408.91*valuePro, width: 285*valuePro, height: 44*valuePro)
        btnRegister.titleLabel?.font = UIFont(name: "Helveti", size: 13.80*valuePro)
        btnRegister.layer.cornerRadius = btnRegister.frame.size.height/2
        btnRegister.backgroundColor = UIColor.init(hexString: "00a4d1")
        btnRegister.setTitle("Crear Cuenta", for: UIControlState.normal)
        btnRegister.setTitleColor(UIColor.white , for: UIControlState.normal)
        self.view.addSubview(btnRegister)
        
        
        
    }
    
    
    

}
