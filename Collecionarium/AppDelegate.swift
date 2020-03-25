//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Firebase
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreDataStack = CoreDataManager.collecionarium

    fileprivate func setupFirebase() {
        FirebaseApp.configure()
    }

    fileprivate func setupBaseColor() {
        self.window?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)
    }

    fileprivate func checkUserLogged() {}

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setupFirebase()
        checkUserLogged()
        setupBaseColor()

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillResignActive(_ application: UIApplication) {
        coreDataStack.saveChanges()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveChanges()
    }
}
