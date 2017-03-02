//
//  NewsViewCell.swift
//  Mall
//
//  Created by Nara on 3/2/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit

class NewsViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        let view = UIView()
        let imageView = UIImageView()
        let lblLabel = UILabel()
        let lblLabel1 = UILabel()
        
        view.frame = CGRect(x: 3, y: 5, width: 151.737*valuePro, height: (300/2)*valuePro)
        view.backgroundColor = UIColor.init(hexString: "d7d4d4")
        self.addSubview(view)
        
        imageView.frame = CGRect(x: 0, y:0*valuePro,width: 151.737*valuePro, height: 90.141*valuePro)
        imageView.image = #imageLiteral(resourceName: "logoMall")
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        
        lblLabel.frame = CGRect(x: 5*valuePro, y: 90.141*valuePro,width: 140*valuePro, height: 16.86*valuePro)
        lblLabel.text = "Viviana de Ferrari"
        lblLabel.textAlignment = NSTextAlignment.left
        lblLabel.font = UIFont (name: "Avenir", size: 15.52*valuePro)
        lblLabel.textColor = UIColor.init(hexString: "4f1563")
        view.addSubview(lblLabel)
        
        lblLabel1.frame = CGRect(x: 5*valuePro, y: 107.001*valuePro,width: 140*valuePro, height: 17*valuePro)
        lblLabel1.text = "De couch a inscripcion del cambio, un gran remate total"
        lblLabel1.textAlignment = NSTextAlignment.left
        lblLabel1.font = UIFont (name: "Avenir", size: 12.02*valuePro)
        lblLabel1.lineBreakMode = .byWordWrapping
        lblLabel1.textColor = UIColor.black
        lblLabel1.numberOfLines = 2
        view.addSubview(lblLabel1)
    }
    
}
