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
    
    private var refreshToken: String? {
        return UserDefaults.standard.string(forKey: "refreshToken")
    }
    
    private var tokenExpDate: Date? {
        return UserDefaults.standard.object(forKey: "tokenExpDate") as? Date
    }
    
    private var shouldRefreshToken: Bool {
        guard let expirationDate = tokenExpDate else {
            return false
        }
        
        let currentDate = Date()
        let fiveMinutes: TimeInterval = 300 + (3600 * 3)
        print("exp: \(expirationDate), currr: \(currentDate.addingTimeInterval(fiveMinutes))")
        return currentDate.addingTimeInterval(fiveMinutes) >= expirationDate
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
    
    private var refreshingToken = false
    
    
    public func refreshIfNeeded(completion: ((Bool) -> Void)?) {
        
        
        guard !refreshingToken else {
            return
        }
        print("1")

        guard shouldRefreshToken else {
            completion?(true)
            return
        }
        print("2")

        guard let refreshToken = self.refreshToken else {
            return
        }
        
        print("3")
        
        print("refresh token: \(refreshToken)")

        // Refresh the token
        guard let url = URL(string: baseURL + "/token") else {
            return
        }
        
        print("4")
        
        print("url: \(url)")
        
        guard let accessToken = accessToken else {
            return
        }
        
        print("5")
        
        print("access token: \(accessToken)")
        
        refreshingToken = true
        
        var request = URLRequest(url: url)
        request.setValue("\(refreshToken)", forHTTPHeaderField: "x-auth-token")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.timeoutInterval = Double.infinity
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            self.refreshingToken = false
            guard let data = data, error == nil else {
                completion?(false)
                return
            }
            
            do {
                print("inside decoder")
                let result = try JSONDecoder().decode(RefreshToken.self, from: data)
                self.tokenAndExp(result: result)
                print("successfully refreshed token")
                print("new token: \(result.token)")
                completion?(true)
            } catch {
                print(error.localizedDescription)
                print("false alarmmmm")
                completion?(false)
            }
            
        }
        task.resume()
        
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
                    self.cacheInfos(result: result)
                    completion(.success(result))
                }
                
            } catch {
                completion(.failure(.init(message: "Response Hatası.")));
            }
            
        }
        task.resume()
    }
    
    private func tokenAndExp(result: RefreshToken) {
        print("token and exp")
        UserDefaults.standard.setValue(result.token, forKey: "token")
        let epochTime = TimeInterval(result.decode.exp + 10800)
        let date = Date(timeIntervalSince1970: epochTime)   // "Apr 16, 2015, 2:40 AM"
        UserDefaults.standard.setValue(date, forKey: "tokenExpDate")
    }
    
    private func cacheInfos(result: User) {
        UserDefaults.standard.setValue(result.decode._id, forKey: "userId")
        UserDefaults.standard.setValue(result.token, forKey: "token")
        UserDefaults.standard.setValue(result.refreshToken, forKey: "refreshToken")
        let epochTime = TimeInterval(result.decode.exp + 10800)
        let date = Date(timeIntervalSince1970: epochTime)  // "Apr 16, 2015, 2:40 AM"
        print("expiration date: \(date)")
        UserDefaults.standard.setValue(date, forKey: "tokenExpDate")
    }
    
    
    
    public func withToken(completion: @escaping (String) -> Void) {

        guard !refreshingToken else {
            if let token = accessToken {
                completion(token)
            }
            print("else refreshing")
            return
        }
        
        if shouldRefreshToken {
            refreshIfNeeded { success in
                if let token = self.accessToken, success {
                    completion(token)
                    print("with refreshed token: \(token)")
                }
            }
        }
        
        else if let token = accessToken {
            completion(token)
            print("else token: \(token)")
        }
        
    }
    
    
    public func signOut(completion: (Bool) -> Void) {
        UserDefaults.standard.setValue(nil, forKey: "token")
        UserDefaults.standard.setValue(nil, forKey: "refreshToken")
        UserDefaults.standard.setValue(nil, forKey: "userId")
        UserDefaults.standard.setValue(nil, forKey: "tokenExpDate")
        
        
        
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
    
    public func deleteUser(completion: @escaping (Bool) -> Void) {
        
        guard let userId = AuthManager.shared.userId else {
            print("failed to get user id")
            return
        }
        
        guard let accessToken = accessToken else {
            return
        }

        
        
        var request = URLRequest(url: URL(string: "\(baseURL)/users/\(userId)")!)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "DELETE"
        request.timeoutInterval = Double.infinity
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(result)
//
                let result = try JSONDecoder().decode(JsonResponses.self, from: data)
                completion(result.success)
                UserDefaults.standard.setValue(nil, forKey: "token")
            } catch {
                completion(false)
                print("catching log out user")
            }
            
            
            
        }
        task.resume()
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    public func forgetPassword(email: String, completion: @escaping (Result<JsonResponses, Error>) -> Void) {
        var request = URLRequest(url: URL(string: "\(baseURL)/users/forget-password")!)
        let url = "https://infpromo.com"
        let parameters: [String: Any] = [
            "url": url,
            "user": [
                "email": email
            ]
        ]
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        request.httpMethod = "POST"
        request.timeoutInterval = Double.infinity
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(JsonResponses.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }

}


