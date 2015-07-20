//
//  Weather.swift
//  WatchWeather
//
//  Created by Wei Wang on 15/7/20.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import Foundation

public struct Weather {
    public enum State: Int {
        case Sunny, Cloudy, Rain, Snow
    }
    
    public let state: State
    public let highTemperature: Int
    public let lowTemperature: Int
    
    public init?(json: [String: AnyObject]) {
        
        guard let stateNumber = json["state"] as? Int,
                  state = State(rawValue: stateNumber) else {
            return nil
        }
        
        guard let highTemperature = json["high_temp"] as? Int else {
            return nil
        }
        
        guard let lowTemperature = json["low_temp"] as? Int else {
            return nil
        }
        
        self.state = state
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
    }
}