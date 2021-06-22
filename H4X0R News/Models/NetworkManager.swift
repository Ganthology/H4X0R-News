//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Boon Kit Gan on 21/06/2021.
//

import Foundation

// ObservableObject protocol allows broadcasting one or many properties to interested parties
class NetworkManager: ObservableObject {
    
    // use posts var to store the posts, then share to other party
    // @Published so it can be published
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                // if no error
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
