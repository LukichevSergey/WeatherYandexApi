//
//  ListTableViewController.swift
//  WeatherYandexApi
//
//  Created by Сергей Лукичев on 06.11.2021.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.fetchWeather()
    }
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
