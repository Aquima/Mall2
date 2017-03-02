//
//  HomeViewController.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
//import SideMenu

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate , SWRevealViewControllerDelegate {

    var btnMenu:UIButton!
    
    
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
        
        let imageTopBar = UIImageView(image:#imageLiteral(resourceName: "logoMall"))
        imageTopBar.frame = CGRect(x: 108*valuePro, y: 20*valuePro, width: 103*valuePro, height: 30*valuePro)
        self.view.addSubview(imageTopBar)
        
        let topBar:UIView = UIView()
        topBar.frame =  CGRect(x:0, y:0, width:  self.view.frame.size.width, height: 55*valuePro)
        topBar.backgroundColor = UIColor.init(hexString: "4f1563")
        self.view.addSubview(topBar)
        
        let btnMenu:UIButton = UIButton()
        btnMenu.setBackgroundImage(#imageLiteral(resourceName: "menu"), for: .normal)
        btnMenu.frame = CGRect(x:0, y:11*valuePro, width: 44*valuePro, height: 44*valuePro)
        btnMenu.addTarget(revealVC, action: #selector((SWRevealViewController.revealToggle) as (SWRevealViewController) -> (Void) -> Void), for: .touchUpInside)
        topBar.addSubview(btnMenu)
        
        let viewPromo = UIView()
        viewPromo.frame = CGRect(x:0, y: 55*valuePro, width: self.view.frame.size.width , height:151.23*valuePro)
        viewPromo.backgroundColor = UIColor.white
        self.view.addSubview(viewPromo)
        
        let viewGreeting = UIView()
        viewGreeting.frame = CGRect(x:0, y: 206.23*valuePro, width: self.view.frame.size.width , height:36.056*valuePro)
        viewGreeting.backgroundColor = UIColor.init(hexString: "4f1563")
        self.view.addSubview(viewGreeting)
        
        let labelGreeting = UILabel()
        labelGreeting.frame = CGRect(x:10.4*valuePro, y: 8.025*valuePro, width: 160*valuePro , height:20*valuePro)
        labelGreeting.text = "¡Hola, soy Febrero!"
        labelGreeting.textColor = UIColor.white
        viewGreeting.addSubview(labelGreeting)
        
        
        /*let viewList = UIView()
        viewList.frame = CGRect(x: 0, y: 242.286*valuePro, width: self.view.frame.size.width, height: 283.443*valuePro)
        viewList.backgroundColor = UIColor.white
        self.view.addSubview(viewList)
        */
        /*let image = UIImageView()
        image.frame = CGRect(x: 254.172*valuePro, y: 27.686*valuePro, width: 30.293*valuePro, height: 30.293*valuePro )
        image.image = #imageLiteral(resourceName: "userList")
        image.layer.cornerRadius = image.frame.size.height/2
        image.layer.masksToBounds = true
        viewList.addSubview(image)*/
        
        
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0 , y: 242.286*valuePro , width:320*valuePro , height: 283.443*valuePro),collectionViewLayout: flowLayout)
        collectionView.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        
        self.view.addSubview(collectionView)
        
        self.navigationController!.isNavigationBarHidden = true

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsViewCell", for: indexPath as IndexPath)
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        return CGSize(width: 151.737*valuePro, height: 151.737*valuePro)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    
    fileprivate func setDefaults() {
 
    }
    // MARK: - Navigation
    

}
