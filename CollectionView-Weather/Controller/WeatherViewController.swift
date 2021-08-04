//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Dmitrii on 16.12.2020.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    var locationButton: UIButton!
    var searchField: UITextField?
    var searchButton: UIButton?
    var conditionView: UIImageView!
    var temperatureLabel: UILabel!
    var cityLabel: UILabel!
    var tableView: UITableView!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    var responseModel: ResponseModel?
    var weatherItems: [WeatherReport] = [WeatherReport]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assingbackground()
        configureTheView()
        
        configurateTableView()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchField?.delegate = self
        
       dismissKeyboard()
        
        
        
    }
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
      var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
      return recognizer
    }()
    
    @objc func dismissKeyboard() {
      searchField?.resignFirstResponder()
    }
    
    func assingbackground() {
        
        let background = UIImage(named:"light_background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func configureTheView() {
        
        locationButton = UIButton(title: "" , titleColor: .clear, font: .systemFont(ofSize: 15) , backgroundColor: .clear , target: self, action: #selector(locationButtonAction(sender:)))
        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
        view.addSubview(locationButton)
        locationButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 40, left: 20, bottom: 100, right: 200), size: .init(width: 40, height: 40))
        
        searchField = UITextField(text: "", placeholder: "Search", keyboardType: .webSearch, returnKeyType: .next, font: UIFont(name: "Helvetica", size: 16)!)
        searchField?.textAlignment = .right
        searchField?.rightViewMode = .always
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
        searchField?.rightView = rightView
        searchField?.layer.cornerRadius = 8
        view.addSubview(searchField!)
        searchField?.anchor(top: view.topAnchor, leading: locationButton.trailingAnchor, bottom: nil, trailing: searchButton?.leadingAnchor, padding: .init(top: 40, left: 10, bottom: 100, right: 20))
        searchField?.backgroundColor = .systemFill
        searchField?.autocapitalizationType = .words
        searchField?.returnKeyType = .go
        searchField?.tintColor = .clear
        searchField?.constrainHeight(40)
        
        searchButton = UIButton(title: "", titleColor: .clear, font: .systemFont(ofSize: 15), backgroundColor: .clear, target: self, action: #selector(searchPressed(sender:)))
        searchButton?.tintColor = .label
        searchButton?.setBackgroundImage(UIImage(systemName: "magnifyingglass"),for: .normal)
        view.addSubview(searchButton!)
        searchButton?.anchor(top: view.topAnchor, leading: searchField?.trailingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 10, bottom: 100, right: 20), size: .init(width: 40, height: 40))
        
        conditionView = UIImageView(image: UIImage(systemName: "sun.max"), cornerRadius: 0, imageContentMode: nil)
        view.addSubview(conditionView)
        conditionView.anchor(top: searchButton?.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20), size: .init(width: 120, height: 120))
        conditionView.tintColor = .label
        
        temperatureLabel = UILabel(text: "21", font: UIFont.systemFont(ofSize: 80, weight: .black), textColor: .label, textAlignment: .center, numberOfLines: 1)
        temperatureLabel.tintColor = .label
        
        let circleLabel = UILabel(text: "°", font: UIFont(name: "Helvetica", size: 80), textColor: .label, textAlignment: .center, numberOfLines: 1)
        circleLabel.tintColor = .label
        
        let celceusLabel = UILabel(text: "C", font: UIFont(name: "Helvetica", size: 80), textColor: .label, textAlignment: .center, numberOfLines: 1)
        celceusLabel.tintColor = .label
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 1
        
        let label = UILabel()
        label.text = "Text"
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(circleLabel)
        stackView.addArrangedSubview(celceusLabel)
        view.addSubview(stackView)
        stackView.anchor(top: conditionView.bottomAnchor, leading: nil, bottom: nil, trailing: conditionView.trailingAnchor)
        
        cityLabel = UILabel(text: "London", font: UIFont(name: "Helvetica", size: 30), textColor: .label, textAlignment: .center, numberOfLines: 1)
        view.addSubview(cityLabel)
        cityLabel.anchor(top: stackView.bottomAnchor, leading: nil, bottom: nil, trailing: stackView.trailingAnchor)
    }
    
    func configurateTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "cellId")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func locationButtonAction(sender: UIButton) {
        locationManager.requestLocation()
        
    }

}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WeatherCell
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        
        let weatherReport = weatherItems[indexPath.row]
        cell.weatherTitleLabel.text = weatherReport.dateString
        cell.weatherImageView.image = UIImage(named: weatherReport.weatherInfo.first!.iconName)!
        
        return cell
    }
}

extension WeatherViewController: UITextFieldDelegate {
   
    @objc func searchPressed(sender: UIButton) {
        searchField?.endEditing(true)
        guard let text = searchField?.text else {
            print("no value")
            return
        }
        
       print(text)
        weatherManager.performRequest(with: String()){ [weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                if let safeData = data {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let responseModel = try decoder.decode(ResponseModel.self, from: safeData)
                        let city = responseModel.city
                        self.weatherItems = responseModel.list
                        
                        DispatchQueue.main.async {
                            self.cityLabel.text = city.name
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField?.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something else"
            return false
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        view.removeGestureRecognizer(tapRecognizer)
        if let city = searchField!.text {
            weatherManager.finalString(cityName: city)
            
        }
        searchField?.text = ""
        
    }
    
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
