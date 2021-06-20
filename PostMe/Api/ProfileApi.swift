//
//  ProfileApi.swift
//  PostMe
//
//  Created by Azmi Muhammad on 20/06/21.
//

import Base
import Profile

struct ProfileApi {
    // Result was introduced in Swift 4.2. You can read the doc here
    // https://developer.apple.com/documentation/swift/result
    func getProfiles(completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/users") {
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
                                let profiles: [ProfileBodyResponse] = try decoder.decode([ProfileBodyResponse].self, from: data)
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
    
    func getDetailProfile(id: Int, completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/users?id=\(id)") {
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
                                let profiles: [ProfileBodyResponse] = try decoder.decode([ProfileBodyResponse].self, from: data)
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
