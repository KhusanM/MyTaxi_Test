//
//  AppDelegate.swift
//  MyTaxi_Test
//
//  Created by Kh's MacBook on 19.12.2021.
//

import UIKit
import GoogleMaps
import AKSideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        GMSServices.provideAPIKey("AIzaSyCE2cFrSFr_YD_m0nm2L_M3LTM3qGo5Wvo")
        if #available(iOS 13.0, *) {window?.overrideUserInterfaceStyle = .light}
        window?.rootViewController = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil))
        
        // Create content and menu controllers
        let navigationController: UINavigationController = UINavigationController.init(rootViewController: MainVC.init())
        let leftMenuViewController: SlideMenuVC = SlideMenuVC.init()
        
        // Create side menu controller
        let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: leftMenuViewController, rightMenuViewController: nil)
        
        // Make it a root controller
        self.window!.rootViewController = sideMenuViewController
        
        self.window!.backgroundColor = UIColor.white
        
        window?.makeKeyAndVisible()
        

        return true
    }
    
    

}

