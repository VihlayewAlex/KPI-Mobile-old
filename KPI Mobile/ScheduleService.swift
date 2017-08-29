//
//  ScheduleService.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

class ScheduleService {
    
    static let sharedInstance = ScheduleService()
    private init() { }
    
    
    func loadScheduleForGroup(withID ID: Int, withCompletion: @escaping ((Schedule?, Error?)->())) {
        
        let url = "https://api.rozklad.hub.kpi.ua/groups/\(ID)/timetable/"
        
        guard let timetableURL = URL(string: url) else {
            withCompletion(nil, APIServiceError.invalidRequestUrl)
            return
        }
        
        URLSession.shared.dataTask(with: timetableURL, completionHandler: { (data, response, error) in
            
            if let error = error {
                withCompletion(nil, error)
            } else {
                if let data = data {
                    do {
                        if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                            
                            if let schedule = ScheduleJSONSerializer.getSchedule(fromJsonObject: jsonObject) {
                                withCompletion(schedule, nil)
                            } else {
                                withCompletion(nil, APIServiceError.invalidResponse)
                            }
                            
                        } else {
                            if let jsonString = String(data: data, encoding: .utf8) {
                                print("Invalid response format:", jsonString)
                            }
                            withCompletion(nil, APIServiceError.invalidResponse)
                        }
                    } catch {
                        withCompletion(nil, error)
                    }
                } else {
                    withCompletion(nil, APIServiceError.noDataReceived)
                }
            }
            
        }).resume()
        
    }
    
}
