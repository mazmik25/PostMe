//
//  ApiError.swift
//  Base
//
//  Created by Azmi Muhammad on 20/06/21.
//

import Foundation
public enum ApiError: Error {
    case invalidURL
    case failedToDecode(error: Error)
    case unknown(error: Error)
}
