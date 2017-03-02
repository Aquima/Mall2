//
//  LeftMenuViewController.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var currentIndex:IndexPath?
    var currentData : [ItemMenu] = []
    var tableView: UITableView!
    var lblTitle : UILabel = UILabel()
    var imgProfile : UIImageView = UIImageView()
    var imgMall : UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hexString: "4f1563")
        
        let itemA:ItemMenu = ItemMenu()
        itemA.urlStringImage = "logo"
        itemA.uidItem = "ak2n1k2"
        itemA.titleItem = "Inicio"
        itemA.imgPlaceHolder = #imageLiteral(resourceName: "iconA")
        
        self.currentData.append(itemA)
        
        let itemB:ItemMenu = ItemMenu()
        itemB.urlStringImage = "logo"
        itemB.uidItem = "ak2n1k2"
        itemB.titleItem = "Beneficios Reales"
        itemB.imgPlaceHolder = #imageLiteral(resourceName: "iconB")
        
        self.currentData.append(itemB)
        let itemC:ItemMenu = ItemMenu()
        itemC.urlStringImage = "logo"
        itemC.uidItem = "ak2n1k2"
        itemC.titleItem = "Entretenimiento"
        itemC.imgPlaceHolder = #imageLiteral(resourceName: "iconC")
        
        self.currentData.append(itemC)
  
        let itemD:ItemMenu = ItemMenu()
        itemD.urlStringImage = "logo"
        itemD.uidItem = "ak2n1k2"
        itemD.titleItem = "Tiendas"
        itemD.imgPlaceHolder = #imageLiteral(resourceName: "iconD")
        self.currentData.append(itemD)
        
        let itemE:ItemMenu = ItemMenu()
        itemE.urlStringImage = "logo"
        itemE.uidItem = "ak2n1k2"
        itemE.titleItem = "Novedades"
        itemE.imgPlaceHolder = #imageLiteral(resourceName: "iconE")
        
        self.currentData.append(itemE)
        
        let itemF:ItemMenu = ItemMenu()
        itemF.urlStringImage = "logo"
        itemF.uidItem = "ak2n1k2"
        itemF.titleItem = "Mi Real Plaza"
        itemF.imgPlaceHolder = #imageLiteral(resourceName: "iconF")
        
        self.currentData.append(itemF)
        
        let itemG:ItemMenu = ItemMenu()
        itemG.urlStringImage = "logo"
        itemG.uidItem = "ak2n1k2"
        itemG.titleItem = "Ajustes"
        itemG.imgPlaceHolder = #imageLiteral(resourceName: "iconG")
        
        self.currentData.append(itemG)
        // ---
        let itemH:ItemMenu = ItemMenu()
        itemH.urlStringImage = "logo"
        itemH.uidItem = "ak2n1k2"
        itemH.titleItem = "Políticas de Privacidad"
        itemH.imgPlaceHolder = #imageLiteral(resourceName: "iconH")
        
        self.currentData.append(itemH)
        
        let itemI:ItemMenu = ItemMenu()
        itemI.urlStringImage = "logo"
        itemI.uidItem = "ak2n1k2"
        itemI.titleItem = "Términos y condiciones"
        itemI.imgPlaceHolder = #imageLiteral(resourceName: "iconI")
        
        self.currentData.append(itemI)

        setupSideMenu()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
  
    // MARK: - Navigation

    fileprivate func setupSideMenu(){
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let topBar:UIView = UIView()
        topBar.frame =  CGRect(x:0, y:20, width:  self.view.frame.size.width, height: 209*valuePro)
        topBar.backgroundColor = UIColor.init(hexString: "4f1563").withAlphaComponent(1.0)
        self.view.addSubview(topBar)
        
        self.imgMall.frame =  CGRect(x: 0*valuePro, y:0 , width: topBar.frame.size.width, height:topBar.frame.size.height - 0*valuePro)
        self.imgMall.image = #imageLiteral(resourceName: "baseimage")
        topBar.addSubview(self.imgMall)
        
        let shadow:UIView = UIView()
        shadow.frame =  CGRect(x: 0*valuePro, y:0 , width: topBar.frame.size.width, height:topBar.frame.size.height - 0*valuePro)
        shadow.backgroundColor = UIColor.init(hexString: "4f1563").withAlphaComponent(0.5)
        topBar.addSubview(shadow)
        
        let imgMall:UIImageView = UIImageView()
        imgMall.frame =  CGRect(x:60*valuePro, y:(topBar.frame.size.height-41.5*valuePro)/2 , width: 101*valuePro, height:41.5*valuePro)
        imgMall.image = #imageLiteral(resourceName: "logoMall")
        topBar.addSubview(imgMall)
        
        
        self.lblTitle = UILabel()
        self.lblTitle.frame =  CGRect(x: 10*valuePro, y:topBar.frame.size.height - 45*valuePro, width: 265*valuePro, height: 40*valuePro)
        self.lblTitle.font = UIFont (name: "Avenir-Black", size: 13*valuePro)
        self.lblTitle.textColor = UIColor.init(hexString: "ffffff")
        self.lblTitle.textAlignment = NSTextAlignment.left
        self.lblTitle.numberOfLines = 2
        self.lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.lblTitle.text = "Raul,\n!Hoy te ves genial!"
        topBar.addSubview(self.lblTitle)
 
        self.imgProfile.frame =  CGRect(x: 10*valuePro, y: topBar.frame.size.height - 40*valuePro, width: 30*valuePro, height: 30*valuePro)
       // self.imgProfile.image = #imageLiteral(resourceName: "user")
        self.imgProfile.layer.cornerRadius = 15*valuePro
        self.imgProfile.layer.masksToBounds = true
        topBar.addSubview(self.imgProfile)
        
        drawBody()
        
    }
    // MARK: - DrawMenu UItableMenu
    func drawBody(){
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let contentOptions:UIView = UIView()
        contentOptions.frame  =  CGRect(x:0, y:229*valuePro, width:267*valuePro, height:self.view.frame.size.height-229*valuePro)
        contentOptions.backgroundColor =  UIColor.init(hexString: "f4f4f4")
        
       

        self.tableView = UITableView(frame: CGRect(x:  0, y: 0*valuePro, width:contentOptions.frame.size.width, height:contentOptions.frame.size.height))
        
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorColor = UIColor.clear
        
        self.tableView.register(UINib(nibName: "ItemMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemMenuTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        contentOptions.addSubview(self.tableView)
        let indexPath = IndexPath(row: 0, section: 0);
        currentIndex = indexPath
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)

        self.view.addSubview(contentOptions)
        
    }
    // MARK: - TableView Datasource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return currentData.count
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemMenuTableViewCell") as! ItemMenuTableViewCell

        let item:ItemMenu = self.currentData[indexPath.row]
        cell.loadWithItem(item: item)

        cell.reloadInputViews()
        return cell
    }
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        return 40*valuePro;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do here
        currentIndex = indexPath
    }
    
    
}
