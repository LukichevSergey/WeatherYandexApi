//
//  NetworkWeatherManager.swift
//  WeatherYandexApi
//
//  Created by Сергей Лукичев on 06.11.2021.
//

import Foundation

struct NetworkWeatherManager {
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Weather) -> Void) {
        let urlString: String = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let weather = self.parseJson(withData: data) {
                completion(weather)
            }
        }
        
        task.resume()
    }
    
    private func parseJson(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
