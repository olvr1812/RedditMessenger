//
//  NetworkManager.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 29.01.2023.
//

import Foundation

struct NetworkManager {
    private let router = NetworkRouter<RedditApi>()
    static let link: NetworkLink = .haveAuth

    func fetchData<anyModel: Decodable>(model: anyModel.Type, apiCase: RedditApi, completion: @escaping (_ model: anyModel?, _ error: String?) -> Void) {
        router.request(apiCase) { data, response, error in
            if  error != nil {
                completion(nil, "Check internet")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.checkNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, "No data")
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let apiResponse = try decoder.decode(model.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, "Error decode")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func checkNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
}
