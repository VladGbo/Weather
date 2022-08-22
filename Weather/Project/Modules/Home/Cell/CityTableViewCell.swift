//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 21.08.2022.
//

import UIKit

protocol CellProtocol {
  static func nibName() -> String
  static func nib() -> UINib
}

extension CellProtocol where Self: UITableViewCell {
  
  static func nibName() -> String {
    String(describing: Self.self)
  }
  
  static func nib() -> UINib {
    return UINib(nibName: nibName(), bundle: nil)
  }
}

protocol CityTableViewCellProtocol {
  var country: String { get }
  var image: UIImage? { get }
  var description: String? { get }
  var temperature: String? { get }
  var height: Float { get }
  var onCellCallBack: ((City) -> Void)? { get set }
  var animateActivityCallBack: SwitchCallBack? { get set }
  var updateUICallBack: VoidCallBack? { get set }
  
  func didTapOnCell()
  func featchWeather()
}

final class CityTableViewCellViewModel: CityTableViewCellProtocol {
  
  
  
  // MARK: - Properties
  
  var country: String {
    city.name
  }
  
  var image: UIImage? {
    weatherImage
  }
  
  var description: String? {
    weatherDescription
  }
  
  var temperature: String? {
    weatherTemperature
  }
  
  var height: Float {
    80.0
  }
  
  var onCellCallBack: ((City) -> Void)?
  var animateActivityCallBack: SwitchCallBack?
  var updateUICallBack: VoidCallBack?
  
  private let city: City
  private var weatherImage: UIImage? = nil
  private var weatherDescription: String? = nil
  private var weatherTemperature: String? = nil
  
  // MARK: - Init
  
  init(city: City) {
    self.city = city
  }
  
  // MARK: - Open functions
  
  func didTapOnCell() {
    onCellCallBack?(city)
  }
  
  func featchWeather() {
    
    let response: ((NetworResult<CurrentWeather>) -> Void) = { [weak self] response in
      self?.animateActivityCallBack?(false)
      
      guard let `self` = self else { return }
      
      switch response {
      case .error(error: let text):
        print(text)
      case .succes(object: let object):
        self.weatherImage = object.weather.first?.weatherImage()
        self.weatherDescription = object.weather.first?.description
        self.weatherTemperature = "min: \(self.calculateCelsius(index: object.main.tempMin)) max: \(self.calculateCelsius(index: object.main.tempMax))"
        
        self.updateUICallBack?()
      }
    }
    
    animateActivityCallBack?(true)
    NetworkRouter.request(
      route: .currentWeather(lat: city.coord.lat, lon: city.coord.lon),
      completion: response
    )
  }
  
  // MARK: - Private functions
  
  private func calculateCelsius(index: Double) -> Int {
    Int(index - 273.15)
  }
}

final class CityTableViewCell: UITableViewCell, CellProtocol {
  
  // MARK: - Outlets
  
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var weatherImageView: UIImageView!
  @IBOutlet private weak var countryLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var temperatureLabel: UILabel!
  @IBOutlet private weak var activityIndicatorView: UIView!
  
  // MARK: - Properties
  
  private var model: CityTableViewCellProtocol!
  private var activityIndicator: ActivityIndicatorView?
  
  // MARK: - LifeCycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configure()
  }
  
  // MARK: - Opeen functions
  
  func setup(with model: CityTableViewCellProtocol) {
    var mutableModel = model
    
    mutableModel.animateActivityCallBack = { [weak self] isOn in
      guard let `self` = self else { return }
      
      DispatchQueue.main.async {
        
        self.activityIndicatorView.isHidden = !isOn
        
        isOn ?
        self.activityIndicator?.startAnimating() :
        self.activityIndicator?.stopAnimating()
      }
    }
    
    mutableModel.updateUICallBack = { [weak self] in
      guard let `self` = self else { return }
      
      DispatchQueue.main.async {
        self.updateUI()
      }
    }
    
    self.model = mutableModel
    
    updateUI()
    model.featchWeather()
  }
  
  // MARK: - Action
  
  @IBAction func onCell(_ sender: UIButton) {
    model.didTapOnCell()
  }
  
  // MARK: - Private functions
  
  private func updateUI() {
    weatherImageView.image = model.image
    countryLabel.text = model.country
    descriptionLabel.text = model.description
    temperatureLabel.text = model.temperature
  }
  
  private func configure() {
    selectionStyle = .none
    activityIndicator = activityIndicatorView.addActivityIndicatorView(bgColor: .clear)
    activityIndicatorView.isHidden = true
    makeBorder()
  }
  
  private func makeBorder() {
    containerView.layer.cornerRadius = 17.0
    containerView.layer.borderWidth = 3.0
    containerView.layer.borderColor = UIColor.red.cgColor
    containerView.clipsToBounds = true
  }
}
