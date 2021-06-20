//
//  ProfileModel.swift
//  PostMe
//
//  Created by Azmi Muhammad on 20/06/21.
//

import Foundation
struct ProfileViewModel {
    let id: Int?
    let title: String?
    let subtitle: String?
    
    init(
        id: Int?,
        title: String?,
        subtitle: String?
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }
}

struct ProfileBodyResponse: Decodable {
    let id: Int?
    let name: String?
    let email: String?
    let address: AddressBodyResponse?
    let phone: String?
    let website: String?
    let company: CompanyBodyResponse?
    
    var fullAdress: String? {
        return """
        \(address?.street ?? "")
        Suite: \(address?.suite ?? "-")
        City: \(address?.city ?? "-")
        Zipcode: \(address?.zipcode ?? "-")
        """
    }
    
    var companyProfile: String? {
        return """
        \(company?.name ?? "Unemployed")
        Catch Phrase:
        \(company?.catchPhrase?.split(separator: " ").compactMap { "- \($0)" }.joined(separator: "\n") ?? "-")
        BS: \(company?.bs ?? "-")
        """
    }
}

struct AddressBodyResponse: Decodable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: GeoLocationBodyResponse?
}

struct CompanyBodyResponse: Decodable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
}

struct GeoLocationBodyResponse: Decodable {
    let lat: String?
    let lng: String?
}
