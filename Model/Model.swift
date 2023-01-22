//
//  ResponseAPI.swift
//  KathiravanVajroTask
//
//  Created by Mac on 21/01/23.
//

import Foundation
import UIKit

struct apiData : Codable{
    let articles : [subArticles]?
    let status : String?
}
struct subArticles : Codable{
    let id : Int?
    let title : String?
    let image : (subImage)?
    let created_at : String?
    let body_html : String?
    let summary_html : String?
    let author : String?
}
struct subImage : Codable{
    let width : Float?
    let height : Int?
    let src : String?
}
struct urlConstants {
    static let link = "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934"
}
struct refreshConstant {
    static let refresh = "Pull to Refresh"
}




