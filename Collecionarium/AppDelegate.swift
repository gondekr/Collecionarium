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

        let fields = [FieldData(id: "", name: "Name", type: .string, isTitle: true)]
        let fields2 = [FieldData(id: "", name: "Name", type: .string, isTitle: true), FieldData(id: "", name: "URL", type: .string, isTitle: false)]
        let group1 = GroupData(id: "", name: "Coll 3", color: "Orange", fields: fields)
        let group2 = GroupData(id: "", name: "Coll 5", color: "Leaf", fields: fields2)
        worker.saveGroup(data: group1)
        worker.saveGroup(data: group2)
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
