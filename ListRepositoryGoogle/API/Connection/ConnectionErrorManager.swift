//
//  ConnectionErrorManager.swift
//  ProjectSky
//
//  Created by Pablo Rosalvo on 27/06/19.
//  Copyright © 2019 Pablo Rosalvo. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class ConnectionErrorManager {
    static func isSuccessfulStatusCode(statusCode: Int) -> Bool {
        if (statusCode >= 200 && statusCode < 300) {
            return true
        }
    return false
    }
    
}
