//
//  WeatherIconHelper.swift
//  WeatherDemo
//This calls the current waether condition and sets it
import Foundation
import SwiftUI

struct WeatherIconHelper {
    static func getWeatherIcon(for condition: String) -> String {
        switch condition.lowercased() {
        case "clear sky":
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
            return "questionmark.circle.fill"
        }
    }
}

