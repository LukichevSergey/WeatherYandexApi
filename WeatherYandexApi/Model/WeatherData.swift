import Foundation

// MARK: - WeatherData
struct WeatherData: Decodable {
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}

// MARK: - Info
struct Info: Codable {
    let url: String
}

// MARK: - Fact
struct Fact: Codable {
    let temp: Int
    let icon: String
    let condition: String
    let windSpeed: Int
    let pressureMm: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let parts: Parts
}

// MARK: - Parts
struct Parts: Codable {
    let day: Day
}

// MARK: - Day
struct Day: Codable {
    let tempMin: Int?
    let tempMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
