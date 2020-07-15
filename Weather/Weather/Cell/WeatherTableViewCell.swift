//
//  TableViewCell.swift
//  Weather
//
//  Created by Vladislav Horbenko on 14.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    private let weakDayLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let weatherImageView = UIImageView()
    
    var model: Weather! {
        didSet {
            update(textColor: .black)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            update(textColor: UIColor.fetch(color: .blue))
            backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 0.3799764555)
        } else {
            update(textColor: .black)
            backgroundColor = .none
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        selectionStyle = .none
        setup(subView: weakDayLabel) { (make) in
            make.left.equalTo(self.snp.left).offset(15.0)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        setup(subView: temperatureLabel) { (make) in
            make.centerX.centerY.equalTo(self)
        }
        
        setup(subView: weatherImageView) { (make) in
            make.right.equalTo(self.snp.right).offset(-15)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(25)
        }
    }

    private func update(textColor: UIColor) {
        let weatherModel = WeatherModel(weather: model)
        temperatureLabel.text = model.fetchTemperatureInfo()
        temperatureLabel.attributedText = model.fetchTemperatureInfo().decorateCity(with: textColor)
        weakDayLabel.text = model.fetchWeak()
        weakDayLabel.attributedText = model.fetchWeak().decorateCity(with: textColor)
        let image = weatherModel.fetchImageWeather()
        weatherImageView.image = image
        weatherImageView.setImageColor(color: textColor)
    }

}
