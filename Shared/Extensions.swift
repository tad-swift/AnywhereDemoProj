//
//  File.swift
//  
//
//  Created by Tadreik Campbell on 6/13/23.
//

import UIKit

extension UIView {
    
    public func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
}
