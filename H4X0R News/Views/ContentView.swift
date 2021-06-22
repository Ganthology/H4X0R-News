//
//  ContentView.swift
//  H4X0R News
//
//  Created by Boon Kit Gan on 20/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    // @ObservedObject and the networkManager is conforming to the protocol as well
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R News")
        }
        // use onAppear to fetch data from API
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Allow list to recognize id as order
// Identifiable protocol

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bye")
//]
