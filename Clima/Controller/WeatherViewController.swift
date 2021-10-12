//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherBrainDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var searchField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    var weatherBrain = WeatherBrain()
    var myWeather: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.delegate = self
        weatherBrain.delegate = self
    }

    @IBAction func onTouchSearch(_ sender: Any) {
        print("Search: ]\(searchField.text!)")
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text!
        if text != "" {
            weatherBrain.fetchWeather(text)
            textField.endEditing(false)
            return true
        }
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    func didUpdateWeather(weather: WeatherData) {
        print("Updated")
        myWeather = weather
        if let w = myWeather {
            DispatchQueue.main.async {
                self.conditionImageView.image = UIImage(systemName: w.conditionName)
                self.temperatureLabel.text = w.tempDecimalString!
                self.cityLabel.text = w.name!
            }
        }
    }
    
    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            self.errorLabel.text = error.localizedDescription
        }
        
    }
}

