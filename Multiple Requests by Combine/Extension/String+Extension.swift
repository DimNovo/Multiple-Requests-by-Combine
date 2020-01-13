//
//  String+Extension.swift
//  Multiple Requests by Combine
//
//  Created by Dmitry Novosyolov on 13/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        prefix(1).localizedCapitalized + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
