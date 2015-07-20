//
//  WeatherViewController.swift
//  WatchWeather
//
//  Created by Wei Wang on 15/7/20.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    enum Day: Int {
        case DayBeforeYesterday = -2
        case Yesterday
        case Today
        case Tomorrow
        case DayAfterTomorrow
        
        static let count = 5
    }
    
    var day: Day?
}
