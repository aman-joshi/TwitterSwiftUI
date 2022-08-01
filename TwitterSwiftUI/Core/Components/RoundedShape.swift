//
//  RoundedShape.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 01/08/22.
//

import SwiftUI

struct RoundedShape:Shape {
    let corners:UIRectCorner
    let cornerRadii:CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerRadii)
        
        return Path(path.cgPath)
    }
    
    
    
}
