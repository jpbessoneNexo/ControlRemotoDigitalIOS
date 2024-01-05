//
//  Orientation.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation

enum Orientation: Equatable {
    case vertical
    case horizontal

    var orientation: String {
        switch self {
        case .vertical:
            return "SV"
        case .horizontal:
            return "SH"
        }
    }

    var label: String {
        switch self {
        case .vertical:
            return "vertical"
        case .horizontal:
            return "horizontal"
        }
    }
}

func getOrientationByLabel(label: String) -> Orientation {
    switch label {
    case Orientation.vertical.orientation:
        return .vertical
    case Orientation.horizontal.orientation:
        return .horizontal
    default:
        return .horizontal
    }
}
