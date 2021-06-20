//
//  FeedApi.swift
//  PostMe
//
//  Created by Azmi Muhammad on 20/06/21.
//

import Foundation

struct FeedApi {
    // Result was introduced in Swift 4.2. You can read the doc here
    // https://developer.apple.com/documentation/swift/result
    func getFeeds(completion: @escaping (Result<[FeedBodyResponse], Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            let request: URLRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error: Error = error {
                    completion(.failure(ApiError.unknown(error: error)))
                    return
                } else if let data: Data = data,
                          let response: HTTPURLResponse = response as? HTTPURLResponse {
                    
                    // Make sure that the server returns a successful status code
                    if Array(200..<300).contains(response.statusCode) {
                        let decoder: JSONDecoder = JSONDecoder()
                        do {
                            let profiles: [FeedBodyResponse] = try decoder.decode([FeedBodyResponse].self, from: data)
                            completion(.success(profiles))
                        } catch {
                            completion(.failure(ApiError.failedToDecode(error: error)))
                        }
                    }
                }
            }
        } else {
            completion(.failure(ApiError.invalidURL))
        }
    }
    
    func getFeedDetail(id: Int, completion: @escaping (Result<FeedBodyResponse, Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") {
            let request: URLRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error: Error = error {
                    completion(.failure(error))
                    return
                } else if let data: Data = data,
                          let response: HTTPURLResponse = response as? HTTPURLResponse {
                    
                    // Make sure that the server returns a successful status code
                    if Array(200..<300).contains(response.statusCode) {
                        let decoder: JSONDecoder = JSONDecoder()
                        do {
                            let profiles: FeedBodyResponse = try decoder.decode(FeedBodyResponse.self, from: data)
                            completion(.success(profiles))
                        } catch {
                            completion(.failure(ApiError.failedToDecode(error: error)))
                        }
                    }
                }
            }
        } else {
            completion(.failure(ApiError.invalidURL))
        }
    }
}
