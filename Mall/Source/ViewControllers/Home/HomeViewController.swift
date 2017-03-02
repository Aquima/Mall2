//
//  HomeViewController.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
//import SideMenu

class HomeViewController: UIViewController,SWRevealViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupSideMenu()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setupSideMenu(){
     let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        let revealVC:SWRevealViewController = self.revealViewController()
        revealVC.panGestureRecognizer()
        revealVC.tapGestureRecognizer()
        
        let topBar:UIView = UIView()
        topBar.frame =  CGRect(x:0, y:0, width:  self.view.frame.size.width, height: 55*valuePro)
        topBar.backgroundColor = UIColor.init(hexString: "4f1563")
        self.view.addSubview(topBar)
        
        let btnMenu:UIButton = UIButton()
        btnMenu.setBackgroundImage(#imageLiteral(resourceName: "menu"), for: .normal)
        btnMenu.frame = CGRect(x:0, y:11*valuePro, width: 44*valuePro, height: 44*valuePro)
        btnMenu.addTarget(revealVC, action: #selector((SWRevealViewController.revealToggle) as (SWRevealViewController) -> (Void) -> Void), for: .touchUpInside)
        topBar.addSubview(btnMenu)
  
        self.navigationController!.isNavigationBarHidden = true

    }
    fileprivate func setDefaults() {
 
    }
    // MARK: - Navigation
    

}
