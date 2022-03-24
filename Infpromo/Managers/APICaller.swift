//
//  APICaller.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.03.2022.
//

import Foundation
import UIKit


final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    struct Constants {
        static let baseAPIURL = "http://192.168.1.53:8000"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    
    
    enum HTTTPMethod: String {
        case GET
        case PUT
        case POST
        case DELETE
        case PATCH
    }
    
    private func createRequest(
        with url: URL?,
        type: HTTTPMethod,
        completion: @escaping (URLRequest) -> Void
    ) {
        guard let apiURL = url else {
            return
            
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = Double.infinity
        completion(request)
    }
    
    
    
    public func logInUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/users/login"), type: .POST) { baseRequest in
            var request = baseRequest
            
            let parameters: [String: Any] = [
                "email": email,
                "password": password
            ]
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(result))
                    
                } catch {
                    print("catch")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    // barkutanlu@gmail.com
    
    
    
    
}
