//
//  ArticlesResults.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//




import Foundation

struct ArticlesResults: Codable {
    
    var uri: String?
    var url: String?
    var id: Int?
    var assetId: Int?
    var source: String?
    var publishedDate : String?
    var updated: String?
    var section: String?
    var subsection: String?
    var nytdsection: String?
    var adxKeywords: String?
    var column: String?
    var byline: String?
    var type: String?
    var title : String?
    var abstract: String?
    var desFacet: [String]?
    var orgFacet: [String]?
    var perFacet: [String]?
    var geoFacet: [String]?
    var media : [Media]?
    var etaId : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case uri = "uri"
        case url = "url"
        case id = "id"
        case assetId = "asset_id"
        case source = "source"
        case publishedDate = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case adxKeywords = "adx_keywords"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media = "media"
        case etaId = "eta_id"
        
    }
    
    init() {
        
    }
    
}
