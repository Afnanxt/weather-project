//
//  ContentView.swift
//  ApiGet
//
//  Created by afnan saad on 29/01/1445 AH.
//
//https://api.openweathermap.org/data/2.5/weather?q={city name},{state code},{country code}&appid={API key}
//https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

import SwiftUI
// my api key b84f7e0ba7ff663649dba3173e3f6afd

struct wether1 : Codable{
    let temp : d
    let humidity : String
    let pressure:String
}
struct ContentView: View {
    let session : URLSession = .shared
    @State var datamodel: wether1?
    
    var body: some View {
        VStack {
            
            Text("Hello, world!")
                .onAppear(){
                let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10&appid")//الربط
                var requst = URLRequest(url: url!)
                    requst.setValue("b84f7e0ba7ff663649dba3173e3f6afd", forHTTPHeaderField: "x-api-key")
                let task = session.dataTask(with: requst)
               {(data , response ,error)
                in
                if let error = error {
                print("Error \(error)")
                return
                    }//error
                    if let data = data {
                                        
                    if let content = String (bytes: data, encoding: .utf8){
                    print(content)
                    //    if let c = String(bytes: data, encoding: .utf8)
                    let decoder = JSONDecoder()
                    do{
                    let weatherData = try decoder.decode(wether1.self, from: data)
                   // let web = try decoder.decode(web.self, from: data)
                        datamodel = weatherData
                    print(weatherData)
                                                
                  }
                catch{
               print ("error", error)
                            }
                            }//content
                            }//data
                            }// data-response-error
                            task.resume()
                            }//on
            Text(datamodel?.humidity ?? "")
                        }//vstak
       
            
        
                    }
    
                }







               
                
                
        
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

