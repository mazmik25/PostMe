//
//  FeedModel.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit
struct FeedModel {
    let image: UIImage?
    let headline: String?
    
    init(
        image: UIImage?,
        headline: String?
    ) {
        self.image = image
        self.headline = headline
    }
}
