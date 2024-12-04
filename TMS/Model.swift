//
//  Model.swift
//  TMS
//
//  Created by Nagarjuna KR on 12/3/24.
//

import Foundation

struct WelcomeElement: Codable {
    let id: Int
    let name: String
    let image: String
    let gender, hair, age, occupation: String?
}

typealias Welcome = [WelcomeElement]
