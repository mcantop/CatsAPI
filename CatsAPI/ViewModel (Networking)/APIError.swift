//
//  APIError.swift
//  CatsAPI
//
//  Created by Maciej on 27/08/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // Info for user.
        switch self {
        case .badURL, .parsing, .unknown:
            return "Something went wrong."
        case .badResponse(_):
            return "Connection to our servers failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    var description: String {
        // Info for developer.
        switch self {
        case .unknown:
            return "Unknown error."
        case .badURL:
            return "Invalid URL."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        case .parsing(let error):
            return error?.localizedDescription ?? "URL session error."
        case .badResponse(statusCode: let statusCode):
            return "Bad response with status code: \(statusCode)."
        }
    }
}
