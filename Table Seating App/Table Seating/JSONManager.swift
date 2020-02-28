//
//  JSON.swift
//  Table Seating
//
//  Created by Sunny Zhao on 2/24/20.
//  Copyright © 2020 Sunny Zhao. All rights reserved.
//


import Foundation

protocol NameManagerDelegate {
    func updateWeather(_ nameManager: JSONManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

class WeatherManager: ObservableObject {

    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8d7ecac042b4bc17fef4f731d7a2c362&units=metric"

    
    var delegate: WeatherManagerDelegate?
    
    //fetchWeather based of city name searched
    func fetchWeather(cityName: String) {
        //This is so city with spaces in their name can also be searched
        let formattedName = cityName.replacingOccurrences(of: " ", with: "+")
        let urlString = "\(weatherURL)&q=\(formattedName)"
        performRequest(with: urlString)
    }
    
    
    //fetchWeather based on location
    func fetchWeather(latitude: Double, longitude: Double) {
         let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
         performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print ("error")
                    return
                }
                if let safeData = data {
                    //parse JSON
                    print ("Success")
                    if let weather = self.parseJSON(safeData) {
                        //call updateWeather within delegates of WeatherManager
                        
                        if (self.delegate == nil){
                            print ("something's wrong")
                        }
                        self.delegate?.updateWeather(self, weather: weather)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    //Same as Angela
    func parseJSON(_ weatherData: Data) -> [String]? {
        let decoder = JSONDecoder()
        do {
            
            //gets data from OpenWeather and decodes it
            let decodedData = try decoder.decode(JSONData.self, from: weatherData)
            
            let name = decodedData.waiters

            return name
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}

let decodedName = NameDecoder(kitchenStaff: ["kenneth"], waiters: ["kenneth"], tables: ["kenneth"])
print(decodedName)



