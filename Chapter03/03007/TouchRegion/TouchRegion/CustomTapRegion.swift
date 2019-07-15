//
//  CustomTapRegion.swift
//  TouchRegion
//
//  Created by CoderDream on 2019/7/15.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class CustomTapRegion: UIView {

    // BEGIN point_inside
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        //print("point: \(point)")
        
        // A point is inside this view if it falls inside a rectangle that's 40pt
        // larger than the bounds of the view        
        return self.bounds.insetBy(dx: -40, dy: -40).contains(point)
    }
    // END point_inside

}
