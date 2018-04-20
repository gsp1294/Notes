//
//  Extension + String.swift
//  Notes
//
//  Created by Gayatri Patil on 20/04/18.
//  Copyright © 2018 Gayatri Patil. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func checkIfEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
