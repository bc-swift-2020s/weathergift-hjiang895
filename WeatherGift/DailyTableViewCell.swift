//
//  DailyTableViewCell.swift
//  WeatherGift
//
//  Created by Hannah Jiang on 3/29/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dailyImageView: UIImageView!
    @IBOutlet weak var dailyLowLabel: UILabel!
    @IBOutlet weak var dailySummaryLabel: UITextView!
    @IBOutlet weak var dailyHighLabel: UILabel!

    @IBOutlet weak var dailyWeekdayLabel: UILabel!
    
    var dailyWeather: DailyWeatherData! {
        didSet {
            dailyImageView.image = UIImage(named: dailyWeather.dailyIcon)
            dailyWeekdayLabel.text = dailyWeather.dailyWeekday
            dailySummaryLabel.text = dailyWeather.dailySummary
            dailyHighLabel.text = "\(dailyWeather.dailyHigh)°"
            dailyLowLabel.text = "\(dailyWeather.dailyLow)°"
        }
    }
}
