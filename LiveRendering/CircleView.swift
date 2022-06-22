//
//  CircleView.swift
//  LiveRendering
//
//  Created by Ruslan Sadritdinov on 22.06.2022.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    @IBInspectable var circleLayerColor: UIColor = UIColor.darkGray {
        didSet{
            updateCircleProperties()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet{
            updateCircleProperties()
        }
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func layoutCircle() {
        if circleLayer == nil {
            circleLayer = CAShapeLayer()
            layer.addSublayer(circleLayer)
            let rect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
            
            let path = UIBezierPath(ovalIn: rect)
            
            circleLayer.fillColor = circleLayerColor.cgColor
            circleLayer.lineWidth = borderWidth
            circleLayer.path = path.cgPath
        }
    }
    
    func updateCircleProperties() {
        if circleLayer != nil {
            circleLayer.fillColor = circleLayerColor.cgColor
            circleLayer.lineWidth = borderWidth
        }
    }
}
