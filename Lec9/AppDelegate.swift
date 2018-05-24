//
//  AppDelegate.swift
//  Lec9
//
//  Created by hackeru on 7 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        saveCastMember()
        loadCastMember()
        return true
    }
    
    
    func loadCastMember()-> [Member] {
        // 1) init NSFetchRequest
        let req = NSFetchRequest<NSManagedObject>(entityName: "CastMember")
        
        var members = [Member]() // new Member array
    
        // 2). context -> run the request
        if let castMembers = try? context.fetch(req){
            for member in castMembers{
                let firstName = member.value(forKey: "firstName") as! String
                let LastName = member.value(forKey: "lastName") as! String
                let age = member.value(forKey: "age") as! Int
                
                members.append(Member(firstName: firstName, lastName: LastName, age: age))
            }
        }
    return members
    }
    
    func saveCastMember(){
        // how do we work with core data ?
        // 1) init NsManagedObject
        let description = NSEntityDescription.entity(forEntityName: "CastMember", in: context)!
        let robert = NSManagedObject(entity: description, insertInto: context)
        // set the attributes
        robert.setValue("Robert", forKey: "firstName")
        robert.setValue("Zane", forKey: "lastName")
        robert.setValue(60, forKey: "age")
        // call the method saveContext - which will save to the hard disk
    }
    
    func saveCastMember(fName: String , lName: String, age: Int){
        // how do we work with core data ?
        // 1) init NsManagedObject
        let description = NSEntityDescription.entity(forEntityName: "CastMember", in: context)!
        let robert = NSManagedObject(entity: description, insertInto: context)
        // set the attributes
        robert.setValue(fName, forKey: "firstName")
        robert.setValue(lName, forKey: "lastName")
        robert.setValue(age, forKey: "age")
        // call the method saveContext - which will save to the hard disk
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Lec9")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {return persistentContainer.viewContext}()

    // MARK: - Core Data Saving support

    func saveContext ()  {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
       
    }

}

