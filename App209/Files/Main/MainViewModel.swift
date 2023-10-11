//
//  MainViewModel.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {
    
    @AppStorage("comparison") var comparison: [String] = []
    
    @Published var isChart: Bool = false
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var estates: [MainModel] = []
    
    @Published var current_estate: MainModel?
    
    @Published var adress: String = ""
    @Published var price: String = ""
    @Published var height: String = ""
    
    @Published var rooms: Int = 0
    @Published var garage: String = ""
    
    func addComparison(adress: String) {
        
        if comparison.count >= 2 {
            
            comparison.removeLast()
        }
        
        if comparison.contains(adress) {
            
            if let indexer = comparison.firstIndex(of: adress) {
                
                comparison.remove(at: indexer)
            }
            
        } else {
            
            comparison.append(adress)
        }
    }
    
    func isCompared(adress: String) -> Bool {
        
        return comparison.contains(adress)
    }
    
    func addEstate(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "MainModel", into: context) as! MainModel
        
        let garageValue = garage == "Yes" ? true : false
        
        trans.address = adress
        trans.price = Int16(price) ?? 0
        trans.ceilingHeight = height
        trans.rooms = Int16(rooms)
        trans.garage = garageValue
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchEstates() {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MainModel>(entityName: "MainModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.estates = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.estates = []
        }
    }
}
