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
        
        var title: String {
            let result: String
            switch self {
            case .DayBeforeYesterday: result = "前天"
            case .Yesterday: result = "昨天"
            case .Today: result = "今天"
            case .Tomorrow: result = "明天"
            case .DayAfterTomorrow: result = "后天"
            }
            return result
        }
        
    }
    
    var day: Day? {
        didSet {
            title = day?.title
        }
    }
}
