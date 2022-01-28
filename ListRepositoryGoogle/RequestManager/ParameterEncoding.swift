//
//  ParameterEncoding.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Foundation

public enum HTTPMethodV2: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public typealias ParametersV2 = [String: Any]

public typealias HTTPHeadersV2 = [String: String]
