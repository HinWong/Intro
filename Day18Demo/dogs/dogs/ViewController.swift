//
//  ViewController.swift
//  dogs
//
//  Created by Luat on 2/3/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createDog()
        findAllDogs()
        let fido = findDog(searchName: "Fido")
        createToy(name: "Ball", color: "green", owner: fido)
        print(fido)
//        deleteAll()
//        findAllDogs()
    }
    
    func createDog() {
        let context = AppDelegate.viewContext
//        let dog: NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Dog", into: context)
//        dog.setValue("Fido", forKey: "name")
        let dog = Dog(context: context)
        dog.name = "Fido"
        saveDatabase()
    }
    
    func createToy(name: String, color: String, owner: Dog?) {
        let toy = Toy(context: AppDelegate.viewContext)
        toy.name = name
        toy.color = color
        toy.owner = owner
        saveDatabase()
    }
    
    func deleteAll() {
        let request: NSFetchRequest<NSFetchRequestResult> = Dog.fetchRequest()
        let batchRequest = NSBatchDeleteRequest(fetchRequest: request)
        try? AppDelegate.viewContext.execute(batchRequest)
    }
    
    func deleteOne(dog: Dog) {
        AppDelegate.viewContext.delete(dog)
        saveDatabase()
    }
    
    func saveDatabase() {
        do {
            try AppDelegate.viewContext.save()
        } catch {
            print("Error saving to DB \(error)")
        }
    }
    
    func findAllDogs() {
//        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dog")
        let request: NSFetchRequest<Dog> = Dog.fetchRequest()
        let context = AppDelegate.viewContext
        let result = try? context.fetch(request)
    }
    
    func findDog(searchName: String) -> Dog? {
//        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dog")
        let request: NSFetchRequest<Dog> = Dog.fetchRequest()
        let predicate = NSPredicate(format: "name = %@", searchName)
        
        request.predicate = predicate
        if let results = try? AppDelegate.viewContext.fetch(request), results.count > 0 {
            return results[0]
        }
        return nil
    }
    
}

