//
//  AppDelegate.swift
//  touch-3d
//
//  Created by Marcos Felipe Souza on 31/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("gett here 2")
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void){
        
        print("gett here")
        print("shortcut \(shortcutItem.type) ou \(shortcutItem.localizedTitle) ")
        guard let types = ApplicationShortcutTypes(rawValue: shortcutItem.localizedTitle) else {return }
        switch types {
            case .nadaFaz:
                return
            case .marcos:
                showMarcos();
                break
        }
    }
    
    func showMarcos(){
        let marcos = Pessoa(nome: "Marcos", idade: 25)
        let pessoaView = PessoaViewController(pessoa: marcos)        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = pessoaView
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }

    enum ApplicationShortcutTypes: String {
        case nadaFaz = "Faz Nada"
        case marcos = "Marcolino"
    }
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

