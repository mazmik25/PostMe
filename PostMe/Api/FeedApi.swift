//
//  FeedApi.swift
//  PostMe
//
//  Created by Azmi Muhammad on 20/06/21.
//

import Foundation

struct FeedApi {
    func getFeeds(completion: @escaping (Result<[FeedBodyResponse], Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "GET"
            DispatchQueue.global(qos: .background).async {
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
                }.resume()
            }
        } else {
            completion(.failure(ApiError.invalidURL))
        }
    }
    
    func fetchDetailFeed(id: Int, completion: @escaping (Result<FeedBodyResponse, Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") {
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "GET"
            DispatchQueue.global(qos: .background).async {
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
                }.resume()
            }
        } else {
            completion(.failure(ApiError.invalidURL))
        }
    }
}
