//
//  ResponseHandler.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation


class ResponseHandler {
	func parseResonseDecode<T: Decodable>(
		data: Data,
		modelType: T.Type,
		completionHandler: ResultHandler<T>
	) {
		do {
			let userResponse = try JSONDecoder().decode(modelType, from: data)
			completionHandler(.success(userResponse))
		}catch {
			completionHandler(.failure(.decoding(error)))
		}
	}

}
