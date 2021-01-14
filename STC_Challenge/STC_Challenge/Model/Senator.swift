//
//  Senator.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import UIKit

struct Response: Codable {
    let objects: [Objects]
}

struct Objects: Codable {
    let extra: Extra
    let person: Person
    let enddate: String
    let website: String
    let description: String
    let party: String
}

struct Extra: Codable {
    let address: String
    let office: String
}

struct Person: Codable {
    let firstname: String
    let lastname: String
    let name: String
    let birthday: String
    let gender: String
    let sortname: String
    let link: String
    let bioguideid: String
}
