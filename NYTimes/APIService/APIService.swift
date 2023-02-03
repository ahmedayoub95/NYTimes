//
//  APIService.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//

import Foundation
import Alamofire
import UIKit

let BASEURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=Q4n9mV1oTb3zF0VouLvFbFf8i1Spr5hE"
class APIService :  NSObject {
    
    static let servicesManager = APIService()
    let encoding: ParameterEncoding = JSONEncoding.prettyPrinted
    

    func getArticlesDataCall<T:Decodable>(requestUrl: String,resultType: T.Type, completionHandler:@escaping(Swift.Result<T?,Error>)-> Void) {
        
        let url = requestUrl
        
        AF.request(BASEURL, method: .get, parameters: nil,encoding:encoding, headers: nil).response { response in
            
            //to get status code
            switch(response.result) {
            case .success(let JSON):
                let decoder = JSONDecoder()
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: JSON!, options: JSONSerialization.ReadingOptions())
                    let prettyData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    let result = try decoder.decode(T.self, from: prettyData)
                    completionHandler(.success(result))
                    print(result)
                }
                catch let error {
                    debugPrint("error occured while decoding = \(error)")
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
