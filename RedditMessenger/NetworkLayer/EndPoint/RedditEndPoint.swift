//
//  RedditEndPoint.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 29.01.2023.
//

import Foundation

enum NetworkLink {
    case haveAuth
}

public enum RedditApi {
    case messages
}

extension RedditApi: EndPointTypeProtocol {
    
    var linkBaseURL: String {
        switch NetworkManager.link {
        case .haveAuth:
            return "https://oauth.reddit.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: linkBaseURL) else { fatalError("error baseURL")}
        return url
    }
    
    var path: String {
        switch self {
        case .messages:
            return "subreddits/mine/subscriber"
        }
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var task: HttpTask {
        switch self {
        case .messages:
            return .requestWithParametersAndHeaders(bodyParameters: nil, urlParameters: nil, headers: headers)
        }
    }
    
    var headers: HttpHeaders? {
        guard let token = UserDefaultsStorage.shared.userToken else { return nil }
        return ["Authorization": "Bearer \(token)"]
    }
}
