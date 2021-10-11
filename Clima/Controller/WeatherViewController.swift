//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var searchField: UITextField!
    
    let weatherData = WeatherBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.delegate = self
    }

    @IBAction func onTouchSearch(_ sender: Any) {
        print("Search: ]\(searchField.text!)")
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text!
        if text != "" {
            weatherData.fetchWeather(text)
            print(weatherData.weatherData!)
            textField.endEditing(false)
            return true
        }
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

