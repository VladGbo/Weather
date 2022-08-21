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
  
  func didTapOnCell()
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
    weatherTemperature
  }
  
  var temperature: String? {
    weatherTemperature
  }
  
  var height: Float {
    80.0
  }
  
  var onCellCallBack: ((City) -> Void)?
  
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
}

final class CityTableViewCell: UITableViewCell, CellProtocol {
  
  // MARK: - Outlets
  
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var weatherImageView: UIImageView!
  @IBOutlet private weak var countryLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var temperatureLabel: UILabel!
  
  // MARK: - Properties
  
  private var model: CityTableViewCellProtocol!
  
  // MARK: - LifeCycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configure()
  }
  
  // MARK: - Opeen functions
  
  func setup(with model: CityTableViewCellProtocol) {
    var mutableModel = model
    self.model = mutableModel
    
    weatherImageView.image = mutableModel.image
    countryLabel.text = mutableModel.country
    descriptionLabel.text = mutableModel.description
    temperatureLabel.text = mutableModel.temperature
  }
  
  // MARK: - Action
  
  @IBAction func onCell(_ sender: UIButton) {
    model.didTapOnCell()
  }
  
  // MARK: - Private functions
  
  private func configure() {
    selectionStyle = .none
    makeBorder()
  }
  
  private func makeBorder() {
    containerView.layer.cornerRadius = 17.0
    containerView.layer.borderWidth = 3.0
    containerView.layer.borderColor = UIColor.red.cgColor
    containerView.clipsToBounds = true
  }
}
