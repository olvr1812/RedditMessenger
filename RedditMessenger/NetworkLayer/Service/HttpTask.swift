//
//  HttpTask.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 29.01.2023.
//

import Foundation

public enum HttpTask {
    case request
    case requestWithParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestWithParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, headers: HttpHeaders?)
}
