import UIKit

class MALogoView: UIView {
    
    struct DrawProperties {
        let margin: UIEdgeInsets
        let lineColor: UIColor
        let lineWith: CGFloat
        
        static var `default`: DrawProperties {
            return DrawProperties(
                margin: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5),
                lineColor: UIColor(red:0.94, green:0.29, blue:0.20, alpha:1.0),
                lineWith: 20.0
            )
        }
    }
    
    var properties: DrawProperties = .default
    private var shapeLayer: CAShapeLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showLogoAnimation()
    }
    
    func addLayerLogo(_ rect: CGRect) {
        shapeLayer?.removeFromSuperlayer()
        
        let rectDraw = rect.inset(by: properties.margin)
    
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(rect: rectDraw).cgPath
    
        let layerPath = getLogoLayer(rect: rectDraw)
        layerPath.mask = mask
        
        layer.addSublayer(layerPath)
        shapeLayer = layerPath
    }
    
    private func getLogoLayer(rect: CGRect) -> CAShapeLayer {
        let lineWith = properties.lineWith
        let rectPath = rect.insetBy(dx: lineWith/2, dy: lineWith/2)
        
        let heigthCrown = rectPath.height * 0.7
        let path = createLinePath(by: [
            CGPoint(x: rectPath.minX, y: rectPath.maxY),
            CGPoint(x: rectPath.midX, y: rectPath.minY + lineWith/2),
            CGPoint(x: rectPath.maxX, y: rectPath.maxY),
            CGPoint(x: rectPath.minX, y: rectPath.maxY),
            CGPoint(x: rectPath.minX, y: rectPath.maxY - heigthCrown),
            CGPoint(x: rectPath.midX, y: rectPath.minY + heigthCrown),
            CGPoint(x: rectPath.maxX, y: rectPath.maxY - heigthCrown),
            CGPoint(x: rectPath.maxX, y: rectPath.maxY)
        ])
        
        let layerPath = CAShapeLayer()
        layerPath.fillColor = UIColor.clear.cgColor
        layerPath.strokeColor = properties.lineColor.cgColor
        layerPath.lineWidth = properties.lineWith
        layerPath.path = path.cgPath
    
        return layerPath
    }
    
    private func createLinePath(by points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        points.enumerated().forEach { (index, point) in
            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.close()
        return path
    }
    
    func showLogoAnimation() {
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        addLayerLogo(self.bounds)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        shapeLayer?.add(animation, forKey: "lineAnimation")
        
        UIView.animate(withDuration: 1.0, delay: 3.0, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
