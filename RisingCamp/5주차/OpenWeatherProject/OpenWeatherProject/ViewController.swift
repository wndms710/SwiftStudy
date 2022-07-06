//
//  ViewController.swift
//  OpenWeatherProject
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var currentStateLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func buttonDidTap(_ sender: Any) {
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
