//
//  HourlyCollectionViewCell.swift
//  WeatherGift
//
//  Created by Hannah Jiang on 3/30/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var raindropImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var hourlyPrecipProbability: UILabel!
    @IBOutlet weak var hourlyTemperature: UILabel!
    @IBOutlet weak var hourlyLabel: UILabel!
    
    var hourlyWeather: HourlyWeather! {
        didSet {
            hourlyLabel.text = hourlyWeather.hour
            iconImageView.image = getIconImage(iconName: hourlyWeather.hourlyIcon)
            hourlyTemperature.text = "\(hourlyWeather.hourlyTemperature)"
            hourlyPrecipProbability.text = "\(hourlyWeather.hourlyPrecipitation)"
            if hourlyWeather.hourlyPrecipitation >= 20 {
                hourlyPrecipProbability.isHidden = false
                raindropImageView.isHidden = false
            } else {
                hourlyPrecipProbability.isHidden = true
                raindropImageView.isHidden = true
            }
        }
    }
        
        func getIconImage(iconName: String) -> UIImage {
            switch iconName {
            case "clear-day":
                return UIImage(systemName: "sun.max") ?? UIImage()
            case "clear-night":
                return UIImage(systemName: "moon") ?? UIImage()
            case "rain":
                return UIImage(systemName: "cloud.rain") ?? UIImage()
            case "snow":
                return UIImage(systemName: "snow") ?? UIImage()
            case "sleet":
                return UIImage(systemName: "cloud.sleet") ?? UIImage()
            case "wind":
                return UIImage(systemName: "wind") ?? UIImage()
            case "fog":
                return UIImage(systemName: "cloud.fog") ?? UIImage()
            case "cloudy":
                return UIImage(systemName: "cloud") ?? UIImage()
            case "partly-cloudy-day":
                return UIImage(systemName: "cloud.sun") ?? UIImage()
            case "partly-cloudy-night":
                return UIImage(systemName: "cloud.moon") ?? UIImage()
            case "hail":
                return UIImage(systemName: "cloud.hail") ?? UIImage()
            case "thunderstorm":
                return UIImage(systemName: "cloud.bolt.rain") ?? UIImage()
            case "tornado":
                return UIImage(systemName: "tornado") ?? UIImage()
            default:
                return UIImage(systemName: "questionmark.diamond") ?? UIImage()
            }
        }
    }

