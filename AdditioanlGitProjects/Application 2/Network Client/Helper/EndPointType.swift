//
//  EndPointType.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation

enum HTTPMethods: String {
	case get = "GET"
	case post = "POST"
}

protocol EndPointType {
	var path: String { get }
	var baseURL: String { get }
	var url: URL? { get }
	var method: HTTPMethods { get }
	var body: Encodable? { get }
	var headers: [String: String]? { get }
	var tokenData: String? {get}
}
