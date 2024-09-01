//
//  WeatherBackgroundHelper.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/31/24.
//

import Foundation
import SwiftUI


// Function to get background color based on time of day and weather condition
func getBackgroundColor(for weather: ResponseBody) -> Color {
    let hour = Calendar.current.component(.hour, from: Date())
    
    switch weather.weather[0].main.lowercased() {
    case "clear":
        if hour < 6 || hour >= 20 {
            return Color.black.opacity(0.7) // Night
        } else if hour < 12 {
            return Color.blue.opacity(0.3) // Morning
        } else if hour < 18 {
            return Color.yellow.opacity(0.8) // Afternoon
        } else {
            return Color.orange.opacity(0.5) // Evening
        }
    case "clouds":
        return Color.gray.opacity(0.5)
    case "rain":
        return Color.blue.opacity(0.7)
    case "snow":
        return Color.white.opacity(0.8)
        // Add more weather conditions as needed
    default:
        return Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
    }
}
