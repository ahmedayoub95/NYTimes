//
//  Media.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//



import Foundation

struct Media: Codable {

  var type:String?
  var subtype:String?
  var caption:String?
  var copyright:String?
  var approvedForSyndication:Int?
  var media_metadata:[MediaMetadata]?

  enum CodingKeys: String, CodingKey {

    case type = "type"
    case subtype = "subtype"
    case caption = "caption"
    case copyright = "copyright"
    case approvedForSyndication = "approved_for_syndication"
    case media_metadata = "media-metadata"
  
  }


  init() {

  }

}
