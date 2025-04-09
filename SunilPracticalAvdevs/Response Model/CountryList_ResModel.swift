//
//  CountryList_ResModel.swift
//  SunilPracticalAvdevs
//
//  Created by sunil prajapati on 09/04/25.
//

import Foundation


// MARK: - WelcomeElement
struct CountryElement: Codable {
    let name: Name
    let currencies: [String: Currency]
    let capital: [String]
    let region: String
    let borders: [String]
    let population: Int
    let flags: Flags
}

// MARK: - Currency
struct Currency: Codable {
    let name, symbol: String
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
}

// MARK: - Name
struct Name: Codable {
    let common: String
}

typealias Country = [CountryElement]
