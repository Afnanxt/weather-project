//
//  weather1.swift
//  ApiGet
//
//  Created by afnan saad on 04/02/1445 AH.
//

import SwiftUI

struct weather1: Codable {
    let coord:Coord
    let weather:[WeatherElement]
    let base:String
    let visiblity:Int
    let wind:Wind
    let clouds :Clouds
    let dt:Int
    let sys:Sys
    let timezone,id:Int
    let name:String
    let cod:Int
    
    
    
}
struct Clouds:Codable{
    let all:Int
    
}
struct Coord{
    let lon:Double
    let lat:Double
    
}
struct Main{
    let temp,feelsLike,tempMin,tempMax:Double
    let pressure,humidity,seeLevel,grandLevel:Int
    
    enum CodingKeys:String,CodingKey{
        
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_Min"
        case tempMax = "temp_max"

    }
    
}

