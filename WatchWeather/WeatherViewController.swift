//
//  WeatherViewController.swift
//  WatchWeather
//
//  Created by Wei Wang on 15/7/20.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import UIKit
import WatchWeatherKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var lowTemprature: UILabel!
    @IBOutlet weak var highTemprature: UILabel!
    
    var day: Day? {
        didSet {
            title = day?.title
        }
    }
}
