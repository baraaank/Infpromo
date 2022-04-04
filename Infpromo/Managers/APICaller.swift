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
        static let baseAPIURL = "http://192.168.1.132:8000"
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
        
        AuthManager.shared.withToken { token in
            guard let apiURL = url else {
                return
            }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = Double.infinity
            completion(request)
        }
    }
    
    

    public func getMostViews(completion: @escaping (Result<MostViews, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/getMostViews"), type: .GET) { baseRequest in
            var request = baseRequest
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MostViews.self, from: data)
//                    let viewCount = result.data.reports.map({
//                        $0.viewCount
//                    })
                   

                    
                    completion(.success(result))
                    
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func searchByUsername(username: String, completion: @escaping (Result<SearchByUsername, Error>) -> Void) {
        guard let userId = AuthManager.shared.userId else {
            print("failed to get user id")
            return
        }
        createRequest(with: URL(string: Constants.baseAPIURL + "/instagram/searchUserName/\(userId)"), type: .POST) { baseRequest in
            var request = baseRequest
            
            let parameters: [String: Any] = [
                "sort": [
                    "field": "followers",
                    "direction": "desc"
                ],
                "page": 0, // for pagination we can declera pageNumber as an Integer
                "filter": [
                    "influencer": [
                        "relevance": [username]
                    ]
                ]
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
                    let result = try JSONDecoder().decode(SearchByUsername.self, from: data)
                    completion(.success(result))
//                    print(result)
                } catch {
                    completion(.failure(error))
                    print(String(describing: error))
                }
                
                
            }
            task.resume()
            
        }
    }
   
    
    // barkutanlu@gmail.com
    
    
    func getUser(completion: @escaping (Result<UserResponse, Error>) -> Void) {
        guard let userId = AuthManager.shared.userId else {
            print("failed to get user id")
            return
        }
        createRequest(with: URL(string:Constants.baseAPIURL + "/users/\(userId)"), type: .GET) { baseRequest in
            var request = baseRequest
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(GetUser.self, from: data)
                    completion(.success(result.data.userPublic))
                } catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    }
    
    func getUserReports(completion: @escaping (Result<[ProfResResponse], Error>) -> Void) {
        guard let userId = AuthManager.shared.userId else {
            print("failed to get user id")
            return
        }

        createRequest(with: URL(string:Constants.baseAPIURL + "/users/\(userId)"), type: .GET) { baseRequest in
            var request = baseRequest

            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }

                do {
//                    let result = try JSONDecoder().decode(User.self, from: data)
//                    let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    let result = try JSONDecoder().decode(GetUser.self, from: data)
                    let resp = result.data.userPublic.reportsLog.map({
                        $0.data.profile.profile
                    })
                    completion(.success(resp))
                    
                    
                } catch {
                    print("catching an error")
                    completion(.failure(error))
                }

            }
            task.resume()
        }
        
    }
    
    public func baseFilterResult(completion: @escaping (Result<SearchWithFilter, Error>) -> Void) {
        guard let userId = AuthManager.shared.userId else {
            print("failed to get user id")
            return
        }
        createRequest(with: URL(string: Constants.baseAPIURL + "/instagram/search/\(userId)"), type: .POST) { baseRequest in
            var request = baseRequest
            
            let parameters: [String: Any] = [
                "sort": [
                    "field": "followers",
                    "direction": "desc"
                ],
                "page": 0, // for pagination we can declera pageNumber as an Integer
                "filter": [
                    "influencer": [
                        "location": [
                            "174737" // tr instagram code
                        ]
                    ]
                ]
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
//                    let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    let result = try JSONDecoder().decode(SearchWithFilter.self, from: data)
                    completion(.success(result))
//                    print(result)
                } catch {
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    }
    
    
    // -MARK: Filteerrrrrrrrrrr
    
    public func filter(minFollowers: Int?,
                       maxFollowers: Int?,
                       gender: String?,
                       interests: [Int?],
                       language: String?,
                       engagementRate: Double?,
                       hasYoutube: Bool?,
                       completion: @escaping (Result<String, Error>) -> Void) {
        
        guard let userId = AuthManager.shared.userId else {
            print("failed to get user id")
            return
        }
        
        createRequest(with: URL(string: Constants.baseAPIURL + "/instagram/search/\(userId)"), type: .POST) { baseRequest in
            var request = baseRequest
            
            

            

           
            
            let parameters: [String: Any] = [
                "sort": [
                    "field": "followers",
                    "direction": "desc"
                ],
                "page": 0, // for pagination we can declera pageNumber as an Integer
                "filter": [
                    "influencer": [
                        "followers": [
                            "min": minFollowers as Any,
                            "max": maxFollowers as Any
                        ],
                        "gender": gender as Any,
                        "interests": interests as Any,
                        "language": language as Any,
                        "engagementRate": engagementRate as Any,
                        "hasYouTube": hasYoutube as Any,
                        "location": [
                            "174737" // tr instagram code
                        ],
                    ]
                ]
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
                    let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                    let result = try JSONDecoder().decode(SearchWithFilter.self, from: data)
//                    completion(.success(result))
                    print(result)
                } catch {
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    }
    
    
    
}