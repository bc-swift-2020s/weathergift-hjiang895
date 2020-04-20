//
//  PageViewController.swift
//  WeatherGift
//
//  Created by Hannah Jiang on 3/23/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var weatherLocations: [WeatherLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLocations()
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([createLocationDetailViewController(forPage: 0)], direction: .forward, animated: false, completion: nil)
        // Do any additional setup after loading the view.
    }
    func loadLocations(){
           guard let locationsEncoded = UserDefaults.standard.value(forKey: "weatherLocations") as? Data else {
               print("ERROR: Could not load weatherLocations data from UserDefaults.")
               weatherLocations.append(WeatherLocation(name:"CURRENT LOCATION", latitude: 20.20, longitude: 20.20))
               return
           }
           let decoder = JSONDecoder()
           if let weatherLocations = try? decoder.decode(Array.self, from: locationsEncoded) as [WeatherLocation]{
               self.weatherLocations = weatherLocations
       
           }else{
               print("ERROR: Couldn't decode data read from UserDefaults.")
           }
        if weatherLocations.isEmpty{
            weatherLocations.append(WeatherLocation(name: "CURRENT LOCATION", latitude: 20.20, longitude: 20.20))
        }
       }
    
    func createLocationDetailViewController(forPage page: Int) -> LocationDetailViewController{
        let detailViewController = storyboard!.instantiateViewController(identifier: "LocationDetailViewController") as LocationDetailViewController
        detailViewController.locationIndex = page
        return detailViewController
        
    }
    
    
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? LocationDetailViewController {
            if currentViewController.locationIndex > 0 {
                return createLocationDetailViewController(forPage: currentViewController.locationIndex - 1)
            }
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? LocationDetailViewController {
            if currentViewController.locationIndex < weatherLocations.count - 1 {
                return createLocationDetailViewController(forPage: currentViewController.locationIndex + 1)
            }
        }
        return nil
    }
}
