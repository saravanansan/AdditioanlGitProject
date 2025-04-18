//
//  Api Handler.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation


class ApiHandler {

	func requestDataAPI(
		url: URLRequest,
		completionHandler: @escaping (Result<Data, DataError>) -> Void
	) {
		let sessionConfig = URLSessionConfiguration.default
		sessionConfig.timeoutIntervalForResource = 3000
		
		let session = URLSession(configuration: sessionConfig).dataTask(with: url) { data, response, error in
			guard let response = response as? HTTPURLResponse,
				  200 ... 299 ~= response.statusCode else {
				let response = response as? HTTPURLResponse
				print(response?.statusCode ?? 0,"status code")
				if response?.statusCode == 401{
					RefreshToken.shared.refreshTokenApi { token , error in
						if token != ""{
							UserDefaults.standard.setValue(token, forKey: "TOKEN")
							UserDefaults.standard.synchronize()
							completionHandler(.failure(.tokenExpire))
						}else{
							completionHandler(.failure(.unAthoried(error)))
						}
					}
				}else{
					completionHandler(.failure(.invalidResponse))
				}
				return
			}
			
			guard let data, error == nil else {
				completionHandler(.failure(.invalidData))
				return
			}
			completionHandler(.success(data))
		}
		session.resume()
	}
	
}
