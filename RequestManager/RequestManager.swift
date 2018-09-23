//
//  RequestManager.swift
//  RequestManager
//
//  Created by Srikanth Solipeta on 9/22/18.
//  Copyright © 2018 apex. All rights reserved.
//

import Foundation

public class RequestManager {
    public static let shared = RequestManager()
    
    func makeRequest(url : String,_ completion: @escaping ([Animal])->()) {
        var animals: [Animal]?
        if let Url = URL(string: url) {
            URLSession.shared.dataTask(with: Url){ (data, response, error) in
                guard let info = data, error == nil, response != nil else{
                    print(error!.localizedDescription)
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let  downloadedAnimals = try decoder.decode(Animals.self, from: info)
                    guard let allAnimals = downloadedAnimals.animals else{
                        return
                    }
                    animals = [Animal]()
                    for animal in allAnimals{
                        let a = Animal(name: animal.name!, imageURL: animal.imageURL!, discription: animal.discription!)
                        animals?.append(a)
                    }
                    
                    guard let animals = animals else{return}
                    completion(animals)
                } catch{
                    print(error.localizedDescription)
                }
                }.resume()
        }
        
    }
    
}
