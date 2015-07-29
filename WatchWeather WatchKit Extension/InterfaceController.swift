//
//  InterfaceController.swift
//  WatchWeather WatchKit Extension
//
//  Created by Wei Wang on 15/7/19.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import WatchKit
import Foundation
import WatchWeatherWatchKit

class InterfaceController: WKInterfaceController {

    static var index = Day.DayBeforeYesterday.rawValue
    static var token: dispatch_once_t = 0
    
    static var controllers = [Day: InterfaceController]()

    @IBOutlet var weatherImage: WKInterfaceImage!
    @IBOutlet var highTempratureLabel: WKInterfaceLabel!
    @IBOutlet var lowTempratureLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        // Configure interface objects here.
        guard let day = Day(rawValue: InterfaceController.index) else {
            return
        }
        
        InterfaceController.controllers[day] = self
        InterfaceController.index = InterfaceController.index + 1
        
        if day == .Today {
            becomeCurrentPage()
        }
        
        dispatch_once(&InterfaceController.token) { () -> Void in
            WeatherClient.sharedClient.requestWeathers({ (weathers, error) -> Void in
                print(weathers)
            })
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func updateWeather(weather: Weather) {
        
    }
}
