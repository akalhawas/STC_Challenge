//
//  STCError.swift
//  STC_Challenge
//
//  Created by ali alhawas on 14/01/2021.
//

import Foundation

enum HError: String, Error {
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
