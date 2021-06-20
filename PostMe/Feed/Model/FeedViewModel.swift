//
//  FeedModel.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit
struct FeedViewModel {
    let id: Int?
    let image: UIImage?
    let headline: String?
    
    init(
        id: Int?,
        image: UIImage?,
        headline: String?
    ) {
        self.id = id
        self.image = image
        self.headline = headline
    }
}

extension FeedViewModel {
    static func mock() -> FeedViewModel {
        return FeedViewModel(
            id: 0,
            image: UIImage(named: "news_placeholder"),
            headline: "This is the sample of the headline"
        )
    }
}

struct FeedBodyResponse: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
