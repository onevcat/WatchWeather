//
//  WeatherViewController.swift
//  WatchWeather
//
//  Created by Wei Wang on 15/7/20.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var titleItem: UINavigationItem!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var lowTemprature: UILabel!
    @IBOutlet weak var highTemprature: UILabel!
    
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
