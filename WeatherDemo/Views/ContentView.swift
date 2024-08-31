//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/30/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var locationManager = LocationManager() //
    var weatherManger = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            //optional
            if let location = locationManager.location{
                if let weather = weather{
                   WeatherView(weather: weather)
                }else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await
                                weatherManger
                                    .getCurrentLocation(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error geting weather: \(error)")
                            }
                        }
                    }
                } else{
                    if locationManager.isloading {
                        LoadingView()
                    }else{
                        //WelcomeView call
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
                }
                
            }
                .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .preferredColorScheme(.dark)
        }
        
    }
    
    struct ContentView_Preview: PreviewProvider {
        static var previews: some View{
            ContentView()
        }
    }

