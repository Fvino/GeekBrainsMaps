//
//  AppDelegate.swift
//  GeekBrainsMaps
//
//  Created by Valeriy Fomin on 27/9/21.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



//    AIzaSyCoes9kF-6EptRJGsXtpA3L4RLch8t8wlw
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCoes9kF-6EptRJGsXtpA3L4RLch8t8wlw")

        //обращение к системе - делать с интервалом
        UIApplication.shared.setMinimumBackgroundFetchInterval(30.0)


        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let url = URL(string: "https://geekbrains.ru/") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
            }

            print("")
        }
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
}

