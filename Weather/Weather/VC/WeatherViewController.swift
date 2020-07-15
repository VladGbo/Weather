//
//  WeatherViewController.swift
//  Weather
//
//  Created by Vladislav Horbenko on 02.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let cityView = CityInfoView()
    private let weatherView = WeatherView()
    private let tableView = UITableView()
    
    var weather: WeatherNetworkModel!
    var city: City!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        tableView.delegate = self
        tableView.dataSource = self
        cityView.delegate = self
        weatherView.delegateWeatherView = self
    }
    
    private func configure() {
        view.backgroundColor = UIColor.fetch(color: .darkBlue)
        cityView.city = city
        view.setup(subView: cityView) { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(view)
            make.height.equalTo(50)
        }
        
        view.setup(subView: weatherView) { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(cityView.snp.bottom)
            make.height.lessThanOrEqualTo(200)
        }
        weatherView.backgroundColor = .green
        weatherView.update(with: weather.daily[0])
        
        view.setup(subView: tableView) { (make) in
            make.top.equalTo(weatherView.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.daily.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = WeatherTableViewCell()
        cell.model = weather.daily[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        weatherView.update(with: weather.daily[indexPath.row])
    }
}

extension WeatherViewController: CityInfoViewDelegate {
    func cityViewWasPressed(city: City) {
        let vc = MapViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        vc.city = city
    }
}

extension WeatherViewController: WeatherViewDelegate {
    func didSwippedDown() {
        dismiss(animated: true, completion: nil)
    }
}
