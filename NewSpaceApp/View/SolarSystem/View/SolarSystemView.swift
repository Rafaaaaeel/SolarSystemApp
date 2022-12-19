//
//  SolarSystemView.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 17/12/22.
//

import UIKit
import SnapKit

class SolarSystemView: UIView {
    
    var whichOneIsSelected = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .primaryBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

//      Uranos
        let neptune = CGRect(x: 25, y: 25, width: Int(self.frame.width - 50), height: Int(self.frame.height - 50))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(whichOneIsSelected == 7 ? UIColor.white.cgColor : UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: neptune)
        context.drawPath(using: .fillStroke)
        
        let neptunePlanet = CGRect(x: 310, y: 310, width: 10, height: 10)
        context.setFillColor(UIColor.neptune.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: neptunePlanet)
        context.drawPath(using: .fillStroke)

//      Neptune
        let uranos = CGRect(x: 45, y: 45, width: Int(self.frame.width - 90), height: Int(self.frame.height - 90))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(whichOneIsSelected == 6 ? UIColor.white.cgColor : UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: uranos)
        context.drawPath(using: .fillStroke)
        
        let uranusPlanet = CGRect(x: 40, y: 200, width: 10, height: 10)
        context.setFillColor(UIColor.uranus.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: uranusPlanet)
        context.drawPath(using: .fillStroke)

//      saturn
        let saturn = CGRect(x: 65, y: 65, width: Int(self.frame.width - 130), height: Int(self.frame.height - 130))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: saturn)
        context.drawPath(using: .fillStroke)
        
        
        let saturnPlanet = CGRect(x: 285, y: 100, width: 10, height: 10)
        context.setFillColor(UIColor.saturn.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: saturnPlanet)
        context.drawPath(using: .fillStroke)

//      juptier
        let juptier = CGRect(x: 85, y: 85, width: Int(self.frame.width - 170), height: Int(self.frame.height - 170))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: juptier)
        context.drawPath(using: .fillStroke)
        
        let juptierPlanet = CGRect(x: 290, y: 240, width: 10, height: 10)
        context.setFillColor(UIColor.juptier.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: juptierPlanet)
        context.drawPath(using: .fillStroke)

//      mars
        let mars = CGRect(x: 105, y: 105, width: Int(self.frame.width - 210), height: Int(self.frame.height - 210))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: mars)
        context.drawPath(using: .fillStroke)
        
        let marsPlanet = CGRect(x: 110, y: 230, width: 10, height: 10)
        context.setFillColor(UIColor.mars.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: marsPlanet)
        context.drawPath(using: .fillStroke)

//      earth
        let earth = CGRect(x: 125, y: 125, width: Int(self.frame.width - 250), height: Int(self.frame.height - 250))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: earth)
        context.drawPath(using: .fillStroke)

        let earthPlanet = CGRect(x: 260, y: 190, width: 10, height: 10)
        context.setFillColor(UIColor.earth.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: earthPlanet)
        context.drawPath(using: .fillStroke)
        
//      venus
        let venus = CGRect(x: 145, y: 145, width: Int(self.frame.width - 290), height: Int(self.frame.height - 290))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: venus)
        context.drawPath(using: .fillStroke)

        let venusPlanet = CGRect(x: 160, y: 230, width: 10, height: 10)
        context.setFillColor(UIColor.venus.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: venusPlanet)
        context.drawPath(using: .fillStroke)
        

//      mercury
        let mercury = CGRect(x: 165, y: 165, width: Int(self.frame.width - 330), height: Int(self.frame.height - 330))
        context.setFillColor(UIColor.primaryBackground.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: mercury)
        context.drawPath(using: .fillStroke)
        
        let mercuryPlanet = CGRect(x: 169, y: 169, width: 10, height: 10)
        context.setFillColor(UIColor.mercury.cgColor)
        context.setLineWidth(1)
        context.addEllipse(in: mercuryPlanet)
        context.drawPath(using: .fillStroke)
        
//      sun
        let sun = CGRect(x: 180, y: 180, width: 30, height: 30)
        context.setFillColor(UIColor.white.cgColor)
        context.setShadow(offset: CGSize(width: 0, height:0), blur: 40, color: CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1))
        context.setLineWidth(1)
        context.addEllipse(in: sun)
        context.drawPath(using: .fillStroke)
        
    }

}
