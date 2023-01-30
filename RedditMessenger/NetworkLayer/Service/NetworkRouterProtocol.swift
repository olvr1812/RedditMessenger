//
//  NetworkRouterProtocol.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 29.01.2023.
//

import Foundation

protocol NetworkRouterProtocol: AnyObject {
    associatedtype EndPoint: EndPointTypeProtocol
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
