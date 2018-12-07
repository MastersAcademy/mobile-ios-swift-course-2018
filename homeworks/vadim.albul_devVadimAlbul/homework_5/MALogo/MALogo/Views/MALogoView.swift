import UIKit

class MALogoView: UIView {

    var margin: UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    var lineColor: UIColor = UIColor(red:0.94, green:0.29, blue:0.20, alpha:1.0)
    var lineWith: CGFloat = 20.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawLogo(self.bounds)
    }
    
    func drawLogo(_ rect: CGRect) {
        let rectDraw = rect.inset(by: margin)

        let heigthCrown = rectDraw.height * 0.7
        let path = createLinePath(by: [
            CGPoint(x: rectDraw.minX + lineWith/2, y: rectDraw.maxY - lineWith/2),
            CGPoint(x: rectDraw.midX, y: rectDraw.minY + lineWith),
            CGPoint(x: rectDraw.maxX - lineWith/2, y: rectDraw.maxY - lineWith/2),
            CGPoint(x: rectDraw.minX + lineWith/2, y: rectDraw.maxY - lineWith/2),
            CGPoint(x: rectDraw.minX + lineWith/2, y: rectDraw.maxY - heigthCrown),
            CGPoint(x: rectDraw.midX, y: rectDraw.minY + heigthCrown),
            CGPoint(x: rectDraw.maxX - lineWith/2, y: rectDraw.maxY - heigthCrown),
            CGPoint(x: rectDraw.maxX - lineWith/2, y: rectDraw.maxY - lineWith/2)
            ])

        let mask = CAShapeLayer()
        mask.path = UIBezierPath(rect: rectDraw).cgPath

        let shapelayer = CAShapeLayer()
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.strokeColor = lineColor.cgColor
        shapelayer.lineWidth = lineWith
        shapelayer.path = path.cgPath
        shapelayer.mask = mask
        
        layer.addSublayer(shapelayer)
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
}
