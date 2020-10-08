//
//  AppDelegate.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initialData()
        
        let tabBarController = TabBarController()
        window?.rootViewController = UINavigationController.init(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        StoreData.shared.saveContext()
    }
}

@available(iOS 13.0, *)
extension AppDelegate {
    func initialData(){
        
        if SharedPref.getBool(from: .initialData) == false {
            
            // Set true if first launch
            SharedPref.saveBool(key: .initialData, value: true)
            
            // Tools data
            let tools = [
                Tool(id: 1, name: "Wrench", itemCount: 6, imageName: "icn_wrench"),
                Tool(id: 2, name: "Cutter", itemCount: 15, imageName: "icn_cutter"),
                Tool(id: 3, name: "Pliers", itemCount: 12, imageName: "icn_pliers"),
                Tool(id: 4, name: "Screwdriver", itemCount: 13, imageName: "icn_screwdriver"),
                Tool(id: 5, name: "Welding machine", itemCount: 3, imageName: "icn_welding_machine"),
                Tool(id: 6, name: "Welding glasses", itemCount: 7, imageName: "icn_welding_glasses"),
                Tool(id: 7, name: "Hammer", itemCount: 4, imageName: "icn_hammer"),
                Tool(id: 8, name: "Measuring Tape", itemCount: 9, imageName: "icn_tape_measure"),
                Tool(id: 9, name: "Alan key set", itemCount: 4, imageName: "icn_alan_key_set"),
                Tool(id: 10, name: "Air compressor", itemCount: 2, imageName: "icn_air_compressor"),
            ]
            
            // Dominic's friends data
            let friends = [
                Loaner(id: 1, name: "Brian"),
                Loaner(id: 2, name: "Luke"),
                Loaner(id: 3, name: "Letty"),
                Loaner(id: 4, name: "Shaw"),
                Loaner(id: 5, name: "Parker"),
            ]
            
            // Saving Core Data
            tools.forEach { StoreData.shared.saveTool($0) }
            friends.forEach { StoreData.shared.saveLoaner($0) }

        }
    }
}
