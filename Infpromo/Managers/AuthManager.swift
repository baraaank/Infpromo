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
    
    public var signInURL: URL? {
        let base = "http://192.168.1.132:8000"
        let finalUrl = "\(base)/users/login"
        return URL(string: finalUrl)
    }
    
    public func logInUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
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
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(User.self, from: data)
                self.cacheToken(result: result)
                self.cacheUserId(result: result)
                completion(.success(result))
                
            } catch {
                completion(.failure(error))
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
    
}
