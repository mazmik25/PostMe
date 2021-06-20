//
//  ProfileModel.swift
//  PostMe
//
//  Created by Azmi Muhammad on 20/06/21.
//

import Foundation
public struct ProfileViewModel {
    public let id: Int?
    public let title: String?
    public let subtitle: String?
    
    public init(
        id: Int?,
        title: String?,
        subtitle: String?
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }
}

public struct ProfileBodyResponse: Decodable {
    public let id: Int?
    public let name: String?
    public let email: String?
    public let address: AddressBodyResponse?
    public let phone: String?
    public let website: String?
    public let company: CompanyBodyResponse?
    
    public var fullAdress: String? {
        return """
        \(address?.street ?? "")
        Suite: \(address?.suite ?? "-")
        City: \(address?.city ?? "-")
        Zipcode: \(address?.zipcode ?? "-")
        """
    }
    
    public var companyProfile: String? {
        return """
        \(company?.name ?? "Unemployed")
        Catch Phrase:
        \(company?.catchPhrase?.split(separator: " ").compactMap { "- \($0)" }.joined(separator: "\n") ?? "-")
        BS: \(company?.bs ?? "-")
        """
    }
}

public struct AddressBodyResponse: Decodable {
    public let street: String?
    public let suite: String?
    public let city: String?
    public let zipcode: String?
    public let geo: GeoLocationBodyResponse?
}

public struct CompanyBodyResponse: Decodable {
    public let name: String?
    public let catchPhrase: String?
    public let bs: String?
}

public struct GeoLocationBodyResponse: Decodable {
    public let lat: String?
    public let lng: String?
}
