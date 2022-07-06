//
//  ViewController.swift
//  OpenWeatherDemoProject
//
//  Created by 김우성 on 2021/08/04.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var currentStateLabel: UILabel!
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK: - Actions
    @IBAction func buttonDidTap(_ sender: UIButton) {
        WeatherRequest().getWeatherData(self)

    }
}


//MARK: - API
extension ViewController {
    
    func didSuccess(_ response: WeatherResponse) {
        
        let weatherMain = response.weather[0].main
        
        self.currentStateLabel.text = weatherMain
    }
}

