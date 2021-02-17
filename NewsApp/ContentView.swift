//
//  ContentView.swift
//  NewsApp
//
//  Created by Mustafa on 14.02.2021.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit

struct ContentView: View {
    @ObservedObject var newsList = getNews()
    
    var body: some View {
        NavigationView {
            VStack {
                List(newsList.news) {new in
                    NavigationLink(
                        destination: webView(url: new.url)) {
                        NewView(title: new.title, description: new.description, image: new.image)
                    }
                }
            }
                .navigationTitle("News")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
