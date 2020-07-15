//
//  CityInfoView.swift
//  Weather
//
//  Created by Vladislav Horbenko on 02.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

protocol CityInfoViewDelegate: NSObject {
    func cityViewWasPressed(city: City)
}

class CityInfoView: UIView {

    private let cityLabel = UILabel()
    private let pointImageView = UIImageView()
    private let targetImageView = UIImageView()
    weak var delegate: CityInfoViewDelegate?
    var city: City!
    var date: Date!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
        setupGesture()
    }
    
    func configure() {
        backgroundColor = UIColor.fetch(color: .darkBlue)
        setup(subView: pointImageView) { (make) in
            make.height.equalTo(25.0)
            make.width.equalTo(15.0)
            make.top.left.equalTo(self).offset(15.0)
        }
        
        setup(subView: targetImageView) { (make) in
            make.width.height.equalTo(20)
            make.top.equalTo(self).offset(15.0)
            make.right.equalTo(self).offset(-15.0)
            make.centerY.equalTo(pointImageView.snp.centerY)
        }
        
        setup(subView: cityLabel) { (make) in
            make.left.equalTo(pointImageView.snp.right).offset(5.0)
            make.right.equalTo(targetImageView.snp.left).offset(5.0)
            make.centerY.equalTo(pointImageView.snp.centerY)
        }
        cityLabel.text = city.name
        cityLabel.attributedText = city.name.decorateCity(with: .white)
        pointImageView.image = #imageLiteral(resourceName: "ic_place")
        targetImageView.image = #imageLiteral(resourceName: "ic_my_location")
    }
    
    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openingMap))
        addGestureRecognizer(gesture)
    }
    
    @objc private func openingMap() {
        delegate?.cityViewWasPressed(city: city)
    }

}
