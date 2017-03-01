//
//  ViewController.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, GMBLPlaceManagerDelegate {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    var placeManager: GMBLPlaceManager!
    var placeEvents : [GMBLVisit] = []
    
    override func viewDidLoad() {
    super.viewDidLoad()
    Gimbal.setAPIKey("8f8d6507-8ff1-4c93-9239-1436e0ce1177", options: nil)
    
    placeManager = GMBLPlaceManager()
    self.placeManager.delegate = self
    GMBLPlaceManager.startMonitoring()
    
    GMBLCommunicationManager.startReceivingCommunications()
    }
    
    func placeManager(_ manager: GMBLPlaceManager!, didBegin visit: GMBLVisit!) -> Void {
    NSLog("Begin %@", visit.place.description)
    self.placeEvents.insert(visit, at: 0)
    self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with:UITableViewRowAnimation.automatic)
    }
    
    func placeManager(_ manager: GMBLPlaceManager!, didEnd visit: GMBLVisit!) -> Void {
    NSLog("End %@", visit.place.description)
    self.placeEvents.insert(visit, at: 0)
    self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.automatic)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: NSInteger) -> NSInteger {
    return self.placeEvents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let visit: GMBLVisit = self.placeEvents[indexPath.row]
    
    if (visit.departureDate == nil) {
    cell.textLabel!.text = NSString(format: "Begin: %@", visit.place.name) as String
    cell.detailTextLabel!.text = DateFormatter.localizedString(from: visit.arrivalDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.medium)
    }
    else {
    cell.textLabel!.text = NSString(format: "End: %@", visit.place.name) as String
    cell.detailTextLabel!.text = DateFormatter.localizedString(from: visit.departureDate, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.medium)
    }
    
    return cell
    }


}

