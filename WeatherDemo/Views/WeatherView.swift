//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/30/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            getBackgroundColor(for: weather)
                .edgesIgnoringSafeArea(.all)
            VStack {
                //Top Head
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .safeAreaPadding(.top,40)
                .frame(maxWidth:.infinity, alignment: .leading)
                
                Spacer()
                //Icon of current weather body
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            //using dynamic icon calling from the components group
                            Image(systemName: WeatherIconHelper.getWeatherIcon(for: weather.weather[0].main))
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        //Display temp top left current weather tempature
                        Text(weather.main.temp.roundDouble() + "°")
                            .font(.system(size: 75))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    //Image of the condition of the weather
                    let iconName = WeatherIconHelper.getWeatherIconName(for: weather.weather[0].main)
                                    Image(iconName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250)

                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth:.infinity, alignment: .leading)
            //Bottom Body
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    //Temps
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (
                            weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (
                            weather.main.tempMax.roundDouble() + "°"))
                    }
                    //wind Icon
                    HStack {
                        WeatherRow(logo: "wind", name: "Winds Speed", value: (
                            weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidty", value: (
                            weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider{
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
