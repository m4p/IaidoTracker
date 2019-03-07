//
//  TallyNumberFormater.swift
//  IaidoTracker
//
//  Created by Martin Pittenauer on 3/6/19.
//  Copyright © 2019 Martin Pittenauer. All rights reserved.
//

import Foundation

extension BinaryInteger{
    var formattedAsTallyList: String {
        
        let fiveGroups = Int(self / 5)
        let rest = Int(self % 5)
        let symbols = ["","","","",""]
        
        var string = String(repeating: symbols[0], count: fiveGroups)
        if (rest != 0) {
            string.append(symbols[rest])
        }
        
        return string
    }
}
