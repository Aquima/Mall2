//
//  ItemMenu.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
enum TypeMenu:Int {
    case normal
    case profile
    case line
}
class ItemMenu: NSObject {
    var urlStringImage:String?
    var uidItem:String?
    var titleItem:String?
    var type:TypeMenu = .normal
    var imgPlaceHolder = UIImage()
}
