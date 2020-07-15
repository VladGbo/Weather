//
//  WeatherView.swift
//  Weather
//
//  Created by Vladislav Horbenko on 08.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

protocol WeatherViewDelegate: NSObject {
    func didSwippedDown ()
    
}

class WeatherView: UIView {

    private let dayLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let temperatureImageView = UIImageView()
    private let weatImageView = UIImageView()
    private let windImageView = UIImageView()
    private let temperatureLabel = UILabel()
    private let windDirectionImage = UIImageView()
    private let weatLabel = UILabel()
    private let windLabel = UILabel()
    
    private let temperatureStack = UIStackView()
    private let weatStack = UIStackView()
    private let windStack = UIStackView()
    private let descriptionStack = UIStackView()
    private let weatherStack = UIStackView()
    
    private var model: Weather!
    
    weak var delegateWeatherView: WeatherViewDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
        backgroundColor = UIColor.fetch(color: .darkBlue)
        setupGesture()
    }
    
    func update(with model: Weather) {
        self.model = model
        setupData()
    }
    
    private func setupData() {
        let weatherModel = WeatherModel(weather: model)
        labelStyle(info: model.formatDate(), label: dayLabel)
        weatherImageView.image = weatherModel.fetchImageWeather()
        weatherImageView.contentMode = .scaleAspectFill
        temperatureImageView.image = UIImage(named: "ic_temp")
        weatImageView.image = UIImage(named: "ic_humidity")
        windImageView.image = UIImage(named: "ic_wind")
        labelStyle(info: model.fetchTemperatureInfo(), label: temperatureLabel)
        labelStyle(info: "\(model.humidity)%", label: weatLabel)
        labelStyle(info: "\(model.windSpeed)/sec", label: windLabel)
        windDirectionImage.image = weatherModel.fetchImageDirectionWind()
    }
    
    private func labelStyle (info: String, label: UILabel) {
        label.text = info
        label.attributedText = info.decorateCity(with: .white)
    }
    
    private func configure() {
        
        setup(subView: dayLabel) { (make) in
            make.left.equalTo(self).offset(10.0)
            make.right.equalTo(self).offset(-10.0)
        }
        
        setup(subView: weatherImageView) { (make) in
            make.top.equalTo(dayLabel.snp.bottom).offset(5.0)
            make.left.equalTo(self.snp.left).offset(20.0)
        }
        
        aligment(for: temperatureStack, axis: .horizontal)
        temperatureStack.addArrangedSubview(temperatureImageView)
        temperatureStack.addArrangedSubview(temperatureLabel)
        
        aligment(for: weatStack, axis: .horizontal)
        weatStack.addArrangedSubview(weatImageView)
        weatStack.addArrangedSubview(weatLabel)
        
        aligment(for: windStack, axis: .horizontal)
        windStack.addArrangedSubview(windImageView)
        windStack.addArrangedSubview(windLabel)
        windStack.addArrangedSubview(windDirectionImage)
        
        aligment(for: descriptionStack, axis: .vertical)
        descriptionStack.addArrangedSubview(temperatureStack)
        descriptionStack.addArrangedSubview(weatStack)
        descriptionStack.addArrangedSubview(windStack)
        
        weatherStackAligment()
        
        setup(subView: weatherStack) { (make) in
            make.left.equalTo(self.snp.left).offset(10.0)
            make.right.equalTo(self.snp.right).offset(-10.0)
            make.centerY.equalTo(self.snp.centerY).offset(10)
        }
    }

    private func aligment(for stack: UIStackView, axis: NSLayoutConstraint.Axis) {
        
        stack.axis = axis
        stack.spacing = 30.0
        stack.alignment = .top
        stack.distribution = .equalSpacing
    }
    
    private func weatherStackAligment() {
        weatherStack.addArrangedSubview(weatherImageView)
        weatherStack.addArrangedSubview(descriptionStack)
        weatherStack.axis = .horizontal
        weatherStack.spacing = 30
        weatherStack.alignment = .center
        weatherStack.distribution = .fillEqually
    }
    
    private func setupGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissFromVC))
        gesture.direction = .down
        addGestureRecognizer(gesture)
    }
    
    @objc private func dismissFromVC() {
        delegateWeatherView?.didSwippedDown()
    }
}
