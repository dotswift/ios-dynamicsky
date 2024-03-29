import Foundation

struct OpenWeatherResponse: Codable {
    var lat, lon: Double?
    var current: Current?
    var hourly: [Current]?
    var daily: [Daily]?
}

struct Current: Codable {
    let epochDate: Int?
    let temp, tempFeelsLike: Double?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case temp, weather
        case epochDate = "dt"
        case tempFeelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main, icon
        case weatherDescription = "description"
    }
}

struct Daily: Codable, Identifiable {
    let id = UUID()
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let pop, uvi: Double?
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, pressure, humidity, weather, clouds, pop, uvi, rain
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
    }
}

struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

struct OpenWeatherSearchResponse: Codable {
    let name: String?
    let searchResults: SearchResults?

    enum CodingKeys: String, CodingKey {
        case name
        case searchResults = "main"
    }
}

struct SearchResults: Codable {
    let temp: Double?
    let feelsLike: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}
