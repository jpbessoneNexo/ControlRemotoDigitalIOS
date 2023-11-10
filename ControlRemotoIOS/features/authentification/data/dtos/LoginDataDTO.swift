//
//  LoginDataDTO.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 07/11/2023.
//

import Foundation

struct LoginDataDTO: Codable {
    let username: String
    let type: String
    let firstName: String
    let lastName: String
    let companyBranch: Int
    let drfToken: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case type
        case firstName = "first_name"
        case lastName = "last_name"
        case companyBranch = "company_branch"
        case drfToken = "drf_token"
    }
}

extension LoginDataDTO {
    func toLoginData() -> LoginData {
        return LoginData(username: username, type: type, firstName: firstName, lastName: lastName, companyBranch: companyBranch, drfToken: drfToken)
    }
}
