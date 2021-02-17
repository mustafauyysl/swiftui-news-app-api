//
//  News.swift
//  NewsApp
//
//  Created by Mustafa on 16.02.2021.
//

import Foundation
import SwiftyJSON

struct New : Identifiable {
    var id = UUID()
    var title : String
    var description: String
    var image: String
    var url: String
}

class getNews : ObservableObject{
    
    @Published var news = [New]()
    
    init() {
        
        let source = "http://newsapi.org/v2/top-headlines?country=us&apiKey=9c163e5edef146b497b38054c6f0cfcd"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for i in json["articles"]{
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let image = i.1["urlToImage"].stringValue
                let url = i.1["url"].stringValue
                
                DispatchQueue.main.async {
                    self.news.append(New(id: UUID(), title: title, description: description, image: image, url: url))
                }
                

            }
            
            
    
        }.resume()
    }
    
}
