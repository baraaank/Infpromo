//
//  AuthManager.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.03.2022.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    var isSignedIn: Bool {
        return accessToken != nil
    }
    
    public var userId: String? {
        return UserDefaults.standard.string(forKey: "userId")
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "token")
    }
    
    let baseURL = "https://www.api.infpromo.com"
    
    public var signInURL: URL? {
        //        let base = "http://localhost:8000"
        
        let finalUrl = "\(baseURL)/users/login"
        return URL(string: finalUrl)
    }
    
    public var signUpURL: URL? {
        return URL(string: "\(baseURL)/users/register")
    }
    
    public func logInUser(email: String, password: String, completion: @escaping (Result<User, UserError>) -> Void) {
        guard let logInURL = signInURL else {
            return
        }
        var request = URLRequest(url: logInURL)
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.timeoutInterval = Double.infinity
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.init(message: "Uygulama Çalışmıyor.")));
                return
            }
            
            guard let data = data else {
                completion(.failure(.init(message: "Veri Bulunamadı.")));
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                if let resultError = try? JSONDecoder().decode(UserError.self, from: data) {
                    completion(.failure(.init(message: resultError.message)))
                }
                return
            }
            
            do {
                if let result = try? JSONDecoder().decode(User.self, from: data) {
                    self.cacheToken(result: result)
                    self.cacheUserId(result: result)
                    completion(.success(result))
                }
                
            } catch {
                completion(.failure(.init(message: "Response Hatası.")));
            }
            
        }
        task.resume()
    }
    
    private func cacheUserId(result: User) {
        UserDefaults.standard.setValue(result.decode._id, forKey: "userId")
    }
    private func cacheToken(result: User) {
        UserDefaults.standard.setValue(result.token, forKey: "token")
    }
    
    public func withToken(completion: @escaping (String) -> Void) {
        if isSignedIn {
            guard let accessToken = accessToken else {
                return
            }
            completion(accessToken)
            
        } else {
            //token is not exist
            print("token is not exist")
        }
    }
    
    
    public func signOut(completion: (Bool) -> Void) {
        UserDefaults.standard.setValue(nil, forKey: "token")
        completion(true)
    }
    
    
    
    
    public func createUser(name: String, surName: String, password: String, email: String, completion: @escaping (Result<JsonResponses, Error>) -> Void) {
        
        
        guard let signUpURL = signUpURL else {
            return
        }
        
        var request = URLRequest(url: signUpURL)
        
        
        let parameters: [String: Any] = [
            "name": name,
            "surName": surName,
            "email": email,
            "password": password
        ]
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.timeoutInterval = Double.infinity
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error as? Error)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(JsonResponses.self, from: data)
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                completion(.success(result))
                print(result)
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


