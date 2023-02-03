
//
//  MediaMetadata.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//


import Foundation

struct MediaMetadata: Codable {
    
    var url    : String?
    var format : String?
    var height : Int?
    var width  : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case url    = "url"
        case format = "format"
        case height = "height"
        case width  = "width"
        
    }
    
    init() {
        
    }
    
}
