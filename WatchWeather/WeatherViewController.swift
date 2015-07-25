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
    
    var weather: Weather? {
        didSet {
            title = weather?.day.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lowTemprature.text = "\(weather!.lowTemperature)℃"
        highTemprature.text = "\(weather!.highTemperature)℃"
        
        let imageName: String
        switch weather!.state {
        case .Sunny: imageName = "sunny"
        case .Cloudy: imageName = "cloudy"
        case .Rain: imageName = "rain"
        case .Snow: imageName = "snow"
        }
        
        weatherImage.image = UIImage(named: imageName)
    }
}
