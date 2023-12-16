//
//  BackgoundProvidingClass.swift
//  SwiftDependecyInjection
//
//  Created by Muhammed fatih Elçi on 16.12.2023.
//

import Foundation
import UIKit

class BackgoundProvidingClass: BackgroundProviderProtocol {
    var backgroundColor: UIColor {
        let backgroundColors: [UIColor] = [.systemGray,.systemRed,.systemBlue,.systemOrange]
        return backgroundColors.randomElement()!
    }
}
