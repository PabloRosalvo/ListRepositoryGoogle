//
//  RequestError.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo on 27/01/22.
//

import Foundation

public class RequestError: Swift.Error {
    public var statusCode: HTTPStatusCode
    public var reason: String
    public var data: [String: Any]?

    public init(reason: String = "", statusCode: Int? = 0, _ json: [String: Any]? = nil) {
        self.reason = reason
        self.statusCode = HTTPStatusCode(rawValue: statusCode ?? 0) ?? .invalidStatus
        self.data = json
    }

    public init(reason: String = "", statusCode: Int? = 0, data: Data?) {
        self.reason = reason
        self.statusCode = HTTPStatusCode(rawValue: statusCode ?? 0) ?? .invalidStatus
        if let dataObject = data, let json = try? JSONSerialization.jsonObject(with: dataObject, options: []) as? [String: Any] {
            self.data = json
        }
    }
    
}
