//
//  EntityAPOD.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation

struct EntityAPOD: Codable {
    var copyright: String?
    var date: String
    var explanation: String
    var mediaType: MediaType
    var serviceVersion: String
    var title: String
    var url: String
    var hdurl: String?
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
        case hdurl
    }
}
