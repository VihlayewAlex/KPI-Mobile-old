//
//  APIServiceError.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

enum APIServiceError: LocalizedError {
    
    case unhandledServerError
    case noDataReceived
    case invalidResponse
    case invalidRequestUrl
    
    var errorDescription: String? {
        switch self {
        case .unhandledServerError:
            return NSLocalizedString("Unhandled server error", comment: "APIServiceError")
        case .noDataReceived:
            return NSLocalizedString("Data loading error", comment: "APIServiceError")
        case .invalidRequestUrl:
            return NSLocalizedString("Invalid request error", comment: "APIServiceError")
        case .invalidResponse:
            return NSLocalizedString("Invalid response error", comment: "APIServiceError")
        }
    }
    
}
