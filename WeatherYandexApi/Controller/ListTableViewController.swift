//
//  ListTableViewController.swift
//  WeatherYandexApi
//
//  Created by Сергей Лукичев on 06.11.2021.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let emptyCity = Weather()
    var citiesArray: [Weather] = []
    let nameCitiesArray = ["Новосибирск", "Москва", "Сочи", "Петербург", "Екатеринбург", "Челябинск"]
    let networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        addCities()
    }
    
    private func addCities() {
        getCityWeather(citiesArray: nameCitiesArray) { [weak self] (index, weather) in
            self?.citiesArray[index] = weather
            self?.citiesArray[index].name = self?.nameCitiesArray[index] ?? "Город"
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell

        var weather = Weather()
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)

        return cell
    }
}
