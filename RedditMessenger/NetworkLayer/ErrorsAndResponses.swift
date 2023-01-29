//
//  ErrorsAndResponses.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 29.01.2023.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}

public enum NetworkResponse: String {
    case success
    case authError = "Authanticate error"
    case failed = "Network request failed"
    case outdated = "The url you requested is outdated"
    case noData = "Response returned with no data to decode"
    case badRequest = "Bad request"
}
