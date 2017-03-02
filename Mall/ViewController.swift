//
//  ViewController.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GMBLPlaceManagerDelegate {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    var placeManager: GMBLPlaceManager!
    var placeEvents : [GMBLVisit] = []
    
    override func viewDidLoad() {
    super.viewDidLoad()
    Gimbal.setAPIKey("748e3614-2b79-45dc-bc9b-5a36383b9eb4", options: nil)
    
    placeManager = GMBLPlaceManager()
    self.placeManager.delegate = self
    GMBLPlaceManager.startMonitoring()
    
    GMBLCommunicationManager.startReceivingCommunications()
    }
    
    func placeManager(_ manager: GMBLPlaceManager!, didBegin visit: GMBLVisit!) -> Void {
    NSLog("Begin %@", visit.place.description)
    self.placeEvents.insert(visit, at: 0)
    //self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with:UITableViewRowAnimation.automatic)
    }
    
    func placeManager(_ manager: GMBLPlaceManager!, didEnd visit: GMBLVisit!) -> Void {
    NSLog("End %@", visit.place.description)
    self.placeEvents.insert(visit, at: 0)
   // self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.automatic)
    }
    
   
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    let visit: GMBLVisit = self.placeEvents[indexPath.row]
//    
//    if (visit.departureDate == nil) {
//    cell.textLabel!.text = NSString(format: "Begin: %@", visit.place.name) as String
//    cell.detailTextLabel!.text = DateFormatter.localizedString(from: visit.arrivalDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.medium)
//    }
//    else {
//    cell.textLabel!.text = NSString(format: "End: %@", visit.place.name) as String
//    cell.detailTextLabel!.text = DateFormatter.localizedString(from: visit.departureDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.medium)
//    }
//    
//    return cell
//    }


}

