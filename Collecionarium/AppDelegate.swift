//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Firebase
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?
    var coreDataStack = CoreDataManager.collecionarium

    fileprivate func setupFirebase() {
        FirebaseApp.configure()
    }

    // Fabric.io Crashlytics
    fileprivate func setupFabric() {
        Fabric.with([Crashlytics.self()])
    }

    fileprivate func setupBaseColor() {
        self.window?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)
        UIApplication.shared.statusBarStyle = .default
    }

    fileprivate func checkUserLogged() {}

    fileprivate func addCollection() {
        let fields = [(key: "Image", type: DataType.string, title: false)]
        GroupDAO().insertGroup(name: "Grupo 2", fields: fields)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupFabric()
        setupFirebase()
        checkUserLogged()
        setupBaseColor()
//        addCollection()

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
