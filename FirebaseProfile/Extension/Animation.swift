//
//  Animation.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.7)
            .delay(0.3 * Double(index))
    }
}
