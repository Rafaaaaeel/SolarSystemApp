//
//  SolarSystemView.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 17/12/22.
//

import UIKit

class SolarSystemView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blueTest
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
//      Uranos
        
        let uranos = CGRect(x: 4, y: 4, width: Int(self.frame.width - 10), height: Int(self.frame.height - 10))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: uranos)
        context.drawPath(using: .fillStroke)
        
//      Neptune
        
        let Neptune = CGRect(x: 14, y: 14, width: Int(self.frame.width - 30), height: Int(self.frame.height - 30))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: Neptune)
        context.drawPath(using: .fillStroke)
        
//      saturn
        let saturn = CGRect(x: 24, y: 24, width: Int(self.frame.width - 50), height: Int(self.frame.height - 50))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: saturn)
        context.drawPath(using: .fillStroke)
        
//      juptier
        let juptier = CGRect(x: 34, y: 34, width: Int(self.frame.width - 70), height: Int(self.frame.height - 70))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: juptier)
        context.drawPath(using: .fillStroke)
        
        
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        
//      sun
        let sun = CGRect(x: w / 2, y: h / 2, width: 40, height: 40)
        context.setFillColor(UIColor.white.cgColor)
//        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: sun)
        context.drawPath(using: .fillStroke)
    }

}
