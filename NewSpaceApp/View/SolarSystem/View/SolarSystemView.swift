//
//  SolarSystemView.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 17/12/22.
//

import UIKit
import SnapKit

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
        let uranos = CGRect(x: 25, y: 25, width: Int(self.frame.width - 50), height: Int(self.frame.height - 50))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: uranos)
        context.drawPath(using: .fillStroke)

//      Neptune
        let Neptune = CGRect(x: 45, y: 45, width: Int(self.frame.width - 90), height: Int(self.frame.height - 90))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: Neptune)
        context.drawPath(using: .fillStroke)

//      saturn
        let saturn = CGRect(x: 65, y: 65, width: Int(self.frame.width - 130), height: Int(self.frame.height - 130))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: saturn)
        context.drawPath(using: .fillStroke)

//      juptier
        let juptier = CGRect(x: 85, y: 85, width: Int(self.frame.width - 170), height: Int(self.frame.height - 170))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: juptier)
        context.drawPath(using: .fillStroke)

//      mars
        let mars = CGRect(x: 105, y: 105, width: Int(self.frame.width - 210), height: Int(self.frame.height - 210))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: mars)
        context.drawPath(using: .fillStroke)

//      earth
        let earth = CGRect(x: 125, y: 125, width: Int(self.frame.width - 250), height: Int(self.frame.height - 250))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: earth)
        context.drawPath(using: .fillStroke)


//      venus
        let venus = CGRect(x: 145, y: 145, width: Int(self.frame.width - 290), height: Int(self.frame.height - 290))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: venus)
        context.drawPath(using: .fillStroke)

        
//      mercury
        let mercury = CGRect(x: 165, y: 165, width: Int(self.frame.width - 330), height: Int(self.frame.height - 330))
        context.setFillColor(UIColor.blueTest.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: mercury)
        context.drawPath(using: .fillStroke)
        
//      sun
        let sun = CGRect(x: 180, y: 180, width: 30, height: 30)
        context.setFillColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: sun)
        context.drawPath(using: .fillStroke)
        
    }

}
