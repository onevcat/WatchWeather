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
    public let day: Day
    
    public init?(json: [String: AnyObject]) {
        
        guard let stateNumber = json["state"] as? Int,
                  state = State(rawValue: stateNumber),
                  highTemperature = json["high_temp"] as? Int,
                  lowTemperature = json["low_temp"] as? Int,
                  dayNumber = json["day"] as? Int,
                  day = Day(rawValue: dayNumber) else {
            return nil
        }
        
        
        self.state = state
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.day = day
    }
}

// MARK: - Parsing weather request
extension Weather {
    static func parseWeatherResult(dictionary: [String: AnyObject]) -> [Weather?]? {
        if let weathers = dictionary["weathers"] as? [[String: AnyObject]] {
            return weathers.map{ Weather(json: $0) }
        } else {
            return nil
        }
    }
}


private let kWeatherResultsKey = "com.onevcat.watchweather.results"
private let kWeatherRequestDateKey = "com.onevcat.watchweather.request_date"

public extension Weather {
    static func storeWeathersResult(dictionary: [String: AnyObject]) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setObject(dictionary, forKey: kWeatherResultsKey)
        userDefault.setObject(NSDate(), forKey: kWeatherRequestDateKey)
        
        userDefault.synchronize()
    }
    
    public static func storedWeathers() -> (requestDate: NSDate?, weathers: [Weather?]?) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        let date = userDefault.objectForKey(kWeatherRequestDateKey) as? NSDate
        
        let weathers: [Weather?]?
        if let dic = userDefault.objectForKey(kWeatherResultsKey) as? [String: AnyObject] {
            weathers = parseWeatherResult(dic)
        } else {
            weathers = nil
        }
        
        return (date, weathers)
    }
}

public extension Weather {
    public func dateByDayWithRequestDate(requestDate: NSDate) -> NSDate {
        let dayOffset = day.rawValue
        let date = requestDate.set(componentsDict: ["hour":0, "minute":0, "second":0])!
        return date + dayOffset.day
    }
}
