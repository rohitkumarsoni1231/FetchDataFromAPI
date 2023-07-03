//
//  NetworkManager.swift
//  FetchDataFromAPI
//
//  Created by Rohit Kumar on 7/4/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getDataFromApi(completion: @escaping (_ apiData : [UserData]) -> (Void)) {
        let url = "https://jsonplaceholder.typicode.com/posts/"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil ).response { response in
            switch response.result {
            case .success(let data) :
                do {
                    let json = try JSONDecoder().decode([UserData].self, from: data!)
                    completion(json)
                } catch {
                    debugPrint(error.localizedDescription)
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    
}
