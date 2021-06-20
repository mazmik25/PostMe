import Base

protocol ProfileApi: Api {
    func getProfiles(completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void)
    func getDetailProfile(userId: Int, completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void)
}

final class ProfileApiService: ProfileApi {
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
    
    func getDetailProfile(userId: Int, completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        if let url: URL = URL(string: "https://jsonplaceholder.typicode.com/users?id=\(userId)") {
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

final class MockProfileApiService: ProfileApi {
    
    private let filename: String
    private let bundle: Bundle
    
    init(
        filename: String,
        bundle: Bundle
    ) {
        self.filename = filename
        self.bundle = bundle
    }
    
    func getProfiles(completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        if let data: Data = loadResponseFromJSONFile(
            withFilename: filename,
            for: bundle
        ) {
            do {
                let profiles: [ProfileBodyResponse] = try JSONDecoder().decode([ProfileBodyResponse].self, from: data)
                completion(.success(profiles))
            } catch {
                completion(.failure(error))
            }
        } else {
            fatalError("File not found")
        }
    }
    
    func getDetailProfile(userId: Int, completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        if let data: Data = loadResponseFromJSONFile(
            withFilename: filename,
            for: bundle
        ) {
            do {
                let profiles: [ProfileBodyResponse] = try JSONDecoder().decode([ProfileBodyResponse].self, from: data)
                completion(.success(profiles))
            } catch {
                completion(.failure(error))
            }
        } else {
            fatalError("File not found")
        }
    }
    
    private func loadResponseFromJSONFile(
        withFilename name: String,
        for bundle: Bundle
    ) -> Data? {
        if let path: String = bundle.path(forResource: name, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path))
            } catch {
                debugPrint("Found an error during fetching the data. Here's the catch \(error)")
                return nil
            }
        } else {
            debugPrint("File not found. Path: \(bundle.bundlePath)")
            return nil
        }
    }
}
