//
//  WeatherIconHelper.swift
//  WeatherDemo
//This calls the current waether condition and sets it
import Foundation
import SwiftUI

struct WeatherIconHelper {
    static func getWeatherIcon(for condition: String) -> String {
        switch condition.lowercased() {
        case "clear":
            return "sun.max.fill"
        case "clouds":
            return "cloud.fill"
        case "rain":
            return "cloud.rain.fill"
        case "drizzle":
            return "cloud.drizzle.fill"
        case "thunderstorm":
            return "cloud.bolt.fill"
        case "snow":
            return "snow"
        case "mist", "fog", "haze":
            return "cloud.fog.fill"
        default:
            return "sun.min"
        }
    }
    
    static func getWeatherIconName(for condition: String) -> String {
        switch condition.lowercased() {
        case "clear":
            return "sun"
        case "clouds":
            return "cloudy"
        case "rain":
            return "rainy-day"
        case "snow":
            return "snowy"
        case "thunderstorm":
            return "thunderstorm"
        case "mist":
            return "cloud"
        default:
            return "sun"  // Fallback image name
        }
    }
    
}

