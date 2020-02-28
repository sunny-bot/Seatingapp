//
//  fetcher.swift
//  Table Seating
//
//  Created by Sunny Zhao on 2/25/20.
//  Copyright © 2020 Sunny Zhao. All rights reserved.
//

import Foundation

protocol FetcherDelegate {
    func updateNames (_ fetcher: Fetcher, info: [[String]], name: String)
}

class Fetcher: ObservableObject {
    
    let urlString = "http://localhost"
    
    var delegate: FetcherDelegate?
    
    func performRequest(name: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("fetch did not work: \(error)")
                    return
                }
                if let safeData = data {
                    //parse JSON info
                    if let info = self.parseJSON(safeData) {
                        self.delegate?.updateNames(self, info: info, name: name)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ nameData: Data) -> [[String]]? {
        let decoder = JSONDecoder()
        
        //get data from WeatherData
        do {
            let decodedData = try decoder.decode(NameData.self, from: nameData)
            
            var arrayOfTables: [[String]] = []
            
            arrayOfTables.append(decodedData.kitchenStaff)
            arrayOfTables.append(decodedData.waiters)
            arrayOfTables.append(decodedData.table1)
            arrayOfTables.append(decodedData.table2)
            arrayOfTables.append(decodedData.table3)
            arrayOfTables.append(decodedData.table4)
            arrayOfTables.append(decodedData.table5)
            arrayOfTables.append(decodedData.table6)
            arrayOfTables.append(decodedData.table7)
            arrayOfTables.append(decodedData.table8)
            arrayOfTables.append(decodedData.table9)
            arrayOfTables.append(decodedData.table10)
            arrayOfTables.append(decodedData.table11)
            arrayOfTables.append(decodedData.table12)
            arrayOfTables.append(decodedData.table13)
            arrayOfTables.append(decodedData.table14)
            arrayOfTables.append(decodedData.table15)
            arrayOfTables.append(decodedData.table16)
            arrayOfTables.append(decodedData.table17)
            arrayOfTables.append(decodedData.table18)
            arrayOfTables.append(decodedData.table19)
            arrayOfTables.append(decodedData.table20)
            arrayOfTables.append(decodedData.table21)
            arrayOfTables.append(decodedData.table22)
            arrayOfTables.append(decodedData.table23)
            arrayOfTables.append(decodedData.table24)
            arrayOfTables.append(decodedData.table25)
            arrayOfTables.append(decodedData.table26)
            arrayOfTables.append(decodedData.table27)
            arrayOfTables.append(decodedData.table28)
            arrayOfTables.append(decodedData.table29)
            arrayOfTables.append(decodedData.table30)
            arrayOfTables.append(decodedData.table31)
            
            //store parsed data in WeatherModel
            return arrayOfTables
        }
            //if error...
        catch {
            return nil
        }
    }
}
