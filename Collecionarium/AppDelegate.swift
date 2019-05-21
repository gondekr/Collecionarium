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
    }

    fileprivate func checkUserLogged() {}

    fileprivate func addCollection() {
        let worker = NewGroupWorker()
        worker.dao = GroupDAO()

        let fields: [String: DataType] = ["Name": .string, "Year": .year]
        let fields2: [String: DataType] = ["Name": .string, "URL": .string]

        worker.saveGroup(name: "Grupo 3", color: "Watermelon", fields: fields, title: "Name")
        worker.saveGroup(name: "Grupo 4", color: "Jeans", fields: fields2, title: "Name")
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
