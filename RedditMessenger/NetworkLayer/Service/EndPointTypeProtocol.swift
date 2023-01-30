//
//  EndPointTypeProtocol.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 29.01.2023.
//

import Foundation

protocol EndPointTypeProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var task: HttpTask { get }
    var headers: HttpHeaders? { get }
}
