//
//  AppDelegate.swift
//  Mall
//
//  Created by Raul Quispe on 2/27/17.
//  Copyright © 2017 Next Latinoamérica. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate,SWRevealViewControllerDelegate,GMBLPlaceManagerDelegate {

    var window: UIWindow?
    var navigationController:UINavigationController?

    var placeManager: GMBLPlaceManager!
    var placeEvents : [GMBLVisit] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        // Override point for customization after application launch.
         window? = UIWindow()
        //this is for set permissions
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                // Enable or disable features based on authorization.
            }
            application.registerForRemoteNotifications()
            center.delegate = self
        }else{
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(setting)
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        let frontNavigationController:UINavigationController
        
        let mainRevealController = SWRevealViewController()
        
        let sidebar = LeftMenuViewController()
        
        let homepage = HomeViewController()
        
        frontNavigationController =  UINavigationController(rootViewController: homepage);
       
        mainRevealController.frontViewController = frontNavigationController;
        mainRevealController.rearViewController = sidebar
    //    revealController.delegate = self;
    
        window?.rootViewController  = mainRevealController
     //this is for setup GIMBAL SDK
        self.setupGimbal()
        return true
    }
    func setupGimbal(){
        Gimbal.setAPIKey("748e3614-2b79-45dc-bc9b-5a36383b9eb4", options: nil)
 
        placeManager = GMBLPlaceManager()
        self.placeManager.delegate = self
        GMBLPlaceManager.startMonitoring()
     //   GMBLPlaceManager.
        GMBLCommunicationManager.startReceivingCommunications()
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK : Remote Notification Register
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
        //call this function for set device token
        //self.registerDevice(deviceToken: deviceTokenString)
        print(UIDevice.current.identifierForVendor as Any )
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,  willPresent notification: UNNotification, withCompletionHandler   completionHandler: @escaping (_ options:   UNNotificationPresentationOptions) -> Void) {
        print("Handle push from foreground")
        // custom code to handle push while app is in the foreground
        print("\(notification.request.content.userInfo)")
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Handle push from background or closed")
        // if you set a member variable in didReceiveRemoteNotification, you  will know if this is from closed or background

        let data: NSDictionary = response.notification.request.content.userInfo["aps"] as! NSDictionary
        let id =  data.object(forKey: "idBenefit") as! NSString
        //id = "3064"
        let notificationName = Notification.Name("prueba")
        NotificationCenter.default.post(name: notificationName, object: id)
    }
    // MARK : GIMBAL
    func placeManager(_ manager: GMBLPlaceManager!, didBegin visit: GMBLVisit!) -> Void {
        NSLog("Begin %@", visit.place.description)
        self.placeEvents.insert(visit, at: 0)
        showPushNotification(title: "Bienvenido a Real Plaza", details: "power on")
        //let ref = FIRDatabase.database().reference()
//        ref.child(visit.visitID!).setValue(["arrivalDate": visit.arrivalDate!.description])
//        ref.child("\(visit.visitID!)/departureDate").setValue(visit.departureDate?.description ?? "")
//        ref.child("\(visit.visitID!)/dwellTime").setValue(visit.dwellTime)
//        ref.child("\(visit.visitID!)/place").setValue(visit.place.name!)
//        ref.child("\(visit.visitID!)/displayname").setValue("")
//        if let authEmail =  FIRAuth.auth()?.currentUser?.email  {
//             ref.child("\(visit.visitID!)/email").setValue(authEmail)
//        }else{
//             ref.child("\(visit.visitID!)/email").setValue("")
//        }
       
        let ref = FIRDatabase.database().reference()
        let key = ref.child("visits").childByAutoId().key
        let post:[String:Any] = ["arrivalDate": visit.arrivalDate?.description ?? "" ,
                                 "departureDate": visit.departureDate?.description ?? "",
                                 "dwellTime": visit.dwellTime,
                                 "email": FIRAuth.auth()?.currentUser?.email ?? ""]
        let childUpdates = ["/visits/\(key)": post]
        ref.updateChildValues(childUpdates)
       
    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
//        
//    }
    func placeManager(_ manager: GMBLPlaceManager!, didEnd visit: GMBLVisit!) -> Void {
        NSLog("End %@", visit.place.description)
        showPushNotification(title: "Vuelve Pronto a Real Plaza", details: "power off")
        self.placeEvents.insert(visit, at: 0)
        // self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.automatic)
        let ref = FIRDatabase.database().reference()
        let key = ref.child("visits").childByAutoId().key
        let post:[String:Any] = ["arrivalDate": visit.arrivalDate?.description ?? "" ,
                                 "departureDate": visit.departureDate?.description ?? "",
                                 "dwellTime": visit.dwellTime,
                                 "email": FIRAuth.auth()?.currentUser?.email ?? ""]
        let childUpdates = ["/visits/\(key)": post]
        ref.updateChildValues(childUpdates)
    }
    // MARK : LOCALNOTIFICATIONS
    func showPushNotification(title: String, details: String) {
        if #available(iOS 10.0, *) {
            let interval = TimeInterval(1)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = details
            let req = UNNotificationRequest(identifier: "localPushNotification", content: content, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.getNotificationSettings(completionHandler: { settings in
                switch settings.authorizationStatus {
                case .notDetermined:
                    center.requestAuthorization(options: [.alert, .sound], completionHandler: { ok, err in
                        if let err = err {
                            print(err)
                            return
                        }
                        if ok {
                            center.add(req, withCompletionHandler: nil)
                        }
                    })
                case .denied: break
                case .authorized:
                    center.add(req, withCompletionHandler: nil)
                    break
                }
            })
            
        } else {
            // handle old iOS versions
        }
    }
    

}

