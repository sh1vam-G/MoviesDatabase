//
//  BaseService.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 05/08/24.
//

import Foundation

enum RequestMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum ErrorType: Error {
    case networkError
    case serverError
    case incorrectRequest
    case unknownStatus
}

class BaseService {
    
    // if url is given then following function can be used
    func executeRequest<T: Codable>(
        urlString: String,
        queryParams: [String: String],
        bodyParams: [String: Any],
        headers: [String: String],
        type: RequestMethods,
        completion: @escaping (Result<T?, ErrorType>) -> ()
    ) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
        let queryItems = queryParams.map{ (key, value) in
            URLQueryItem(name: key,value: value)
        }
        var request = URLRequest(url: url)
        if !bodyParams.isEmpty {
            request.httpMethod = type.rawValue
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
            } catch(let error) {
                print("error converting to data from json body")
                print(error)
                completion(Result.failure(.incorrectRequest))
            }
        }
        request.url?.append(queryItems: queryItems)
        headers.forEach{ (key,value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print(err)
                completion(.failure(.serverError))
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                if (400...499).contains(httpResponse.statusCode) {
                    completion(.failure(.incorrectRequest))
                    print(data)
                } else if (500...599).contains(httpResponse.statusCode) {
                    completion(.failure(.serverError))
                    print(data)
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.unknownStatus))
                    print(data)
                    return
                }
            }
            
            if let data = data {
                do {
                    let resp = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(resp))
                } catch(let error) {
                    print(error)
                    completion(.success(nil))
                }
            }
        }
        
        dataTask.resume()
        
        
    }
    
    //if data is stored in the local then following function can be used
    func getData<T>(bundleLocation: AnyObject.Type, type: T.Type, fileName: String) -> T? where T : Decodable {
        if let path = Bundle(for: bundleLocation).path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let moreMenuDataModel = try JSONDecoder().decode(T.self, from: data)
                return moreMenuDataModel
            } catch let error {
                fatalError("Unable to get data from file at \(path), failed because \(error), file: \(fileName)")
            }
        } else {
            fatalError("Unable to get data from file at file: \(fileName)")
        }
        return nil
    }
}

