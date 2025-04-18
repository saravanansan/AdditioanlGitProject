//
//  RefreshToken.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 15/07/24.
//

import Foundation


final class RefreshToken{
    static let shared = RefreshToken()
    private init(){}
    
    
	func refreshTokenApi(username: String = API_Url_Constant.shared.username,password: String = API_Url_Constant.shared.password,tokenURL: String = API_Url_Constant.shared.tokenURL,completion: @escaping (String?,Error?) -> ()){
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			completion(nil,nil)
			return
		}
		let parameters : Data = "username=\(username)&password=\(password)&grant_type=password".data(using: .utf8)!
		let url = URL(string: tokenURL)!
		let session = URLSession.shared
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = parameters
		request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
		request.addValue("application/json", forHTTPHeaderField: "Accept")
		
		let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
			guard error == nil else {
				return
			}
			guard let data = data else {
				return
			}
			do{
				let parseddata = try JSONDecoder().decode(TokenModels.self, from: data)
				print(parseddata.access_token ?? "")
				completion(parseddata.access_token ?? "",nil)
			}catch let parsingError {
				print("Error", parsingError)
				completion("",parsingError)
			}
		})
		task.resume()
		
	}
}



