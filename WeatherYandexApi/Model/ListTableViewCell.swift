//
//  ListTableViewCell.swift
//  WeatherYandexApi
//
//  Created by Сергей Лукичев on 06.11.2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var conditionCityLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    
    func configure(weather: Weather) {
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.condition
        self.tempCityLabel.text = weather.temperatureString
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
