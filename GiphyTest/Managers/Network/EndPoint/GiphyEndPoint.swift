//
//  GiphyEndPoint.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum GiphyApi {
    case search(name:String)
}

extension GiphyApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        
        case .production: return "http://api.giphy.com/v1/gifs/"
        case .qa: return "http://api.giphy.com/v1/gifs/"
        case .staging: return "http://api.giphy.com/v1/gifs/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        default: return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .search(let name):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":App.GiphyAPIKey,
                                                      "q":name,
                                                      "limit": 5])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


