//
//  ApiManager.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation


enum DataError: Error {
	case invalidResponse
	case invalidURL
	case invalidData
	case network
	case decoding(Error?)
	case unAthoried(Error?)
	case tokenExpire
}


typealias ResultHandler<T> = (Result<T, DataError>) -> Void
typealias JSON = [String: Any]

protocol ApiManagerProtocol{
	func request<T: Codable>(modelType: T.Type,params: JSON?,type: EndPointType,completion: @escaping ResultHandler<T>
	)
}

final class APIManager: ApiManagerProtocol {

//	static let shared = APIManager()
	private let networkHandler: ApiHandler
	private let responseHandler: ResponseHandler

	init(networkHandler: ApiHandler = ApiHandler(),
		 responseHandler: ResponseHandler = ResponseHandler()) {
		self.networkHandler = networkHandler
		self.responseHandler = responseHandler
	}

	func request<T: Codable>(
		modelType: T.Type,params: JSON?,
		type: EndPointType,
		completion: @escaping ResultHandler<T>
	) {
		
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			DispatchQueue.main.async {
				completion(.failure(.network))
			}
			return
		}
		
		let token = type.tokenData
		guard let url = type.url else {
			completion(.failure(.invalidURL))
			return
		}

		var request = URLRequest(url: url)
		print("Url: -\(url)")
		print("Request: - \(String(describing: params))")
		request.httpMethod = type.method.rawValue
		if let params = params{
			request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
		}
		
		if let parameters = type.body {
			request.httpBody = try? JSONEncoder().encode(parameters)
		}

		request.allHTTPHeaderFields = type.headers
        if let token = token{
			request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

		// Network Request - URL TO DATA
		networkHandler.requestDataAPI(url: request) { result in
			switch result {
			case .success(let data):
				self.responseHandler.parseResonseDecode(
					data: data,
					modelType: modelType) { response in
						switch response {
						case .success(let mainResponse):
								DispatchQueue.main.async {
									completion(.success(mainResponse))
								}
						case .failure(.tokenExpire):
								self.request(modelType: modelType, params: params, type: type, completion: completion)
						case .failure(let error):
								DispatchQueue.main.async {
									completion(.failure(error))
								}
						}
					}
			case .failure(.tokenExpire):
						self.request(modelType: modelType, params: params, type: type, completion: completion)
			case .failure(let error):
					DispatchQueue.main.async {
						completion(.failure(error))
					}
			}
		}
	}
	
	static var commonHeaders: [String: String] {
		return [
			"Content-Type": "application/json",
			"Accept": "application/json",
			
		]
	}

}

