//
//  WeatherClient.swift
//  WatchWeather
//
//  Created by Wei Wang on 15/7/25.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import Foundation

public let WatchWeatherKitErrorDomain = "com.onevcat.WatchWeatherKit.error"
public struct WatchWeatherKitError {
    public static let CorruptedJSON = 1000
}


public struct WeatherClient {
    
    public static let sharedClient = WeatherClient()
    let session = NSURLSession.sharedSession()
    
    public func requestWeathers(handler: ((weather: [Weather?]?, error: NSError?) -> Void)?) {
        
        guard let url = NSURL(string: "https://raw.githubusercontent.com/onevcat/WatchWeather/master/Data/data.json") else {
            handler?(weather: nil, error: NSError(domain: NSURLErrorDomain, code: NSURLErrorBadURL, userInfo: nil))
            return
        }
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil {
                handler?(weather: nil, error: error)
            } else {
                do {
                    let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    if let dictionary = object as? [String: AnyObject] {
                        handler?(weather: Weather.parseWeatherResult(dictionary), error: nil)
                    }
                } catch _ {
                    handler?(weather: nil, error: NSError(domain: WatchWeatherKitErrorDomain, code: WatchWeatherKitError.CorruptedJSON, userInfo: nil))
                }
            }
        }
        
        task!.resume()
    }
}

