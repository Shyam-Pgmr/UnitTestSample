//
//  Services.swift
//  UnitTestSample
//
//  Created by Shyam Kumar on 17/06/19.
//  Copyright © 2019 Shyam Kumar. All rights reserved.
//

import Foundation

enum UTError: Error {
    case invalidUrl
    case jsonParsing
    case serverError
    case clientError
    case emptyData
    case noInternet
    case slowConnection
    case unknown
}

final class Services {
    static let shared = Services()
    private let CourcesEndpoint = "https://api.letsbuildthatapp.com/jsondecodable/courses"
}

extension Services {
    
    func fetchCourses(completionBlock: @escaping (Result<[Course]?,Error>)->Void) {
        guard let url = URL(string: CourcesEndpoint) else {
            completionBlock(.failure(UTError.invalidUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completionBlock(.failure(UTError.serverError))
                return
            }
            switch response.statusCode {
            case 200:
                guard let data = data else {
                    completionBlock(.failure(UTError.emptyData))
                    return
                }
                do {
                    let cources = try JSONDecoder().decode([Course].self, from: data)
                    completionBlock(.success(cources))
                } catch {
                    completionBlock(.failure(UTError.jsonParsing))
                }
            case 400...499:
                completionBlock(.failure(UTError.clientError))
            case 500...599:
                completionBlock(.failure(UTError.serverError))
            case -1009:
                completionBlock(.failure(UTError.noInternet))
            case -1001:
                completionBlock(.failure(UTError.slowConnection))
            default:
                completionBlock(.failure(UTError.unknown))
            }
            }.resume()
    }
}
