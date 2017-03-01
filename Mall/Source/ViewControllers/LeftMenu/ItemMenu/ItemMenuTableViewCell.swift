//
//  ItemMenuTableViewCell.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit

class ItemMenuTableViewCell: UITableViewCell {

    var contentCell : UIView = UIView()
    var imgIcon : UIImageView = UIImageView()
    var lblTitle : UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        self.contentCell.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 265*valuePro, height: 40*valuePro)
        self.contentCell.layer.masksToBounds = true
    
        addSubview(self.contentCell)
        
        self.imgIcon = UIImageView()
        self.imgIcon.frame =  CGRect(x: 0*valuePro, y: 0*valuePro, width: 40*valuePro, height: 40*valuePro)
        self.contentCell.addSubview(self.imgIcon)

        self.lblTitle.frame =  CGRect(x: 40*valuePro, y: 0*valuePro, width: 265*valuePro, height: 40*valuePro)
        self.lblTitle.font = UIFont (name: "Avenir", size: 13*valuePro)
        self.lblTitle.textColor = UIColor.init(hexString: "4f1563")
        self.lblTitle.textAlignment = NSTextAlignment.left
        self.lblTitle.numberOfLines = 1
        self.lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
     //self.lblTitle.text = "Inicio"
        self.contentCell.addSubview(self.lblTitle)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected == true{
            self.contentCell.backgroundColor = UIColor.init(hexString: "f1f1f1")
        }else{
            self.contentCell.backgroundColor = UIColor.init(hexString: "ffffff")
        }
        
        // Configure the view for the selected state
    }
    func loadWithItem(item:ItemMenu){
        self.lblTitle.text = item.titleItem
        self.imgIcon.image = item.imgPlaceHolder
    }
    
}
