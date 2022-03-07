//
//  WeatherData.swift
//  myFirstAppSB
//
//  Created by Joeun Kim on 1/23/21.
//

import Foundation
enum WeatherPeriod {
    case Morning
    case Afternoon
    case Evening
    case Night
}

enum OutfitCategory {
    case Upper
    case Eyewear
}
class WeatherData {
    private var zipCode : [String]

    init() { // insert test data
        zipCode = ["10001"]
    }
    

    /* Needed weather data
     City Name -> String
     Date/Day Text (ex: 1/1 Monday, 1/2 Tuesday, ...)
     Weather Condition Description (ex: clear, rainny, foggy, ...)
     Weather Condition Comparison Tag (ex: Temperature higher/lower, Subshine more/less)
     Weather Comparison (pivot (yesterday), target(today))   (ex: colder, warmer, similar, ...)
     
     
     By Day
        1. Outfit
        2. Forecast for Day
         - Temperature
         - High / Low
         - feels like
         - wind
         - Chance Of Rain
         - precipitation
         - humidity
         - uv index
         - visibility
         - dew point
         - pressure
         - Sunrise/Sunset Time
         - Weather condition description
        3. Difference (Compared to yesterday)
         - Temperature
         - Sunrise/Sunset Time
        4. Weather Condition Icon
        5. Temperature Unit
     
     By Today's Time Period (Morning, Afternoon, Evening, Night)
        1. Outfit
        2. Forecast for Time Period
         - Temperature
         - Difference
         - Chance Of Rain
        3. Difference (Compared to the yesterday's time period)
         - Temperature
        4. Weather Condition Icon

     By Hour (1pm, 2pm, 3pm, ....)
        1. Outfit
        2. Forecast for Hours
         - Temperature
         - Chance Of Rain
        3. Weather Condition Icon

     

     ForecastVC : Sunrise/Sunset countdown
     */
    
//    private var forecastArr : [[String : Int]]
//    private var forecast = ["Temperature" : -20, "FeelsLike" : -25, "Pressure" : 10]
//    private var sunRiseSetForDay : Date
//    private var descriptionForDay : String // Sunny Windy...
//    private var descriptionForPeriod : String
//    private var descriptionForHour : String
//
//
//    var outfit = [OutfitCategory.Upper: "padding",
//                  OutfitCategory.Eyewear: "sunglass"
//    ]
//
//    func currentTemp() -> Double {
//        // check Zip and get Weather Data
//        return 0.0
//    }
//
//    func currentOutFit() -> [Int] {
//        return [0, 0]
//    }
//
//    func weatherComparisonText(period: WeatherPeriod) {
//        switch period {
//        case .Morning:
//            break
//        case .Afternoon:
//            break
//        case .Evening:
//            break
//        case .Night:
//            break
//        }
//    }
}
