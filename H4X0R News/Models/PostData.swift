//
//  PostData.swift
//  H4X0R News
//
//  Created by Boon Kit Gan on 21/06/2021.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // id is for list to identify and order
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
