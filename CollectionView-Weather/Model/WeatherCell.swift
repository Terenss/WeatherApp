//
//  weatherCell.swift
//  WeatherApp
//
//  Created by Dmitrii on 01.03.2021.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    var weatherImageView = UIImageView()
    var weatherTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(weatherImageView)
        addSubview(weatherTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setWeatherImageViewConstraints()
        setWeatherTitleLabel()
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        
        weatherImageView.layer.cornerRadius = 10
        weatherImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        
        weatherTitleLabel.numberOfLines = 0
        weatherTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setWeatherImageViewConstraints() {
     
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        weatherImageView.widthAnchor.constraint(equalTo: weatherImageView.heightAnchor, multiplier: 16/9).isActive = true
        
    }
    
    func setWeatherTitleLabel() {
        weatherTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherTitleLabel.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 20).isActive = true
        weatherTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        weatherTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
