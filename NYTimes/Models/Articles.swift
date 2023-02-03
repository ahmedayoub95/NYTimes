//
//  Articles.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//

import Foundation

struct Articles: Codable {

  var status: String?
  var copyright: String?
  var numResults: Int?
  var results: [ArticlesResults]?

  enum CodingKeys: String, CodingKey {

    case status  = "status"
    case copyright = "copyright"
    case numResults = "num_results"
    case results = "results"
  
  }

  init() {

  }

}
