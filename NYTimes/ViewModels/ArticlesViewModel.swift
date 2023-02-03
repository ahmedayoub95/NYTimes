//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//

import Foundation

import Foundation


class ArticlesViewModel: NSObject{
    
    static let manager = ArticlesViewModel()
    private var apiService: APIService?
    
    override init() {
        self.apiService = APIService()
    }
    
    func articleApiCall(completionHandler : @escaping(Result<Articles, Error>)-> Void ) {

    
        self.apiService?.getArticlesDataCall(requestUrl: "",resultType: Articles.self, completionHandler: { response in
            
            switch response {
            case .success(let response):
                
                print(response as Any)
                completionHandler(.success(response!))
            case .failure(let error):
                completionHandler(.failure(error))
                print(error)
            }
            
        })

        
        
        
    }


}
