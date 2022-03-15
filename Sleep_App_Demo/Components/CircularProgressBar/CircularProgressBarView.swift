import UIKit

class CircularProgressBarView: UIView {
    
    
    // MARK: - Instance Properties
    
    var barWidth: CGFloat = 10.0
    var barStyle: CAShapeLayerLineCap = .square
    var progress: CGFloat = 0.0 {
        didSet {
            createProgressBar()
        }
    }
    var barColor: UIColor = .white
    var fillColor: UIColor = .blue
    
    private var startAngle: CGFloat = -.pi / 2.0
    private var endAngle:CGFloat = 3 * .pi / 2
    private var barLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?

    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureViewsOnLoad()
    }
    
}

// MARK: - Private Methods

private extension CircularProgressBarView {
    
    private func configureViewsOnLoad() {
        barLayer = CAShapeLayer()
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.size.width / 2.0,
                y: frame.size.height / 2.0
            ),
            radius: frame.size.width/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        
        barLayer?.path = circularPath.cgPath
        barLayer?.fillColor = UIColor.white.cgColor
        barLayer?.lineCap = .square
        barLayer?.lineWidth = barWidth
        barLayer?.strokeColor = barColor.cgColor
        guard let barLayer = barLayer else  { return }
        layer.addSublayer(barLayer)
    }
    
    private func createProgressBar() {
        progressLayer?.removeFromSuperlayer()
        progressLayer = CAShapeLayer()
        let angleRange = endAngle - startAngle
        
        let progressAngle = startAngle + (angleRange * progress)
        
        let progressPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.size.width / 2.0,
                y: frame.size.height / 2.0
            ),
            radius: frame.size.width/2,
            startAngle: startAngle,
            endAngle:  progressAngle,
            clockwise: true
        )
        
        progressLayer?.path = progressPath.cgPath
        progressLayer?.fillColor = UIColor.clear.cgColor
        progressLayer?.lineCap = .round
        progressLayer?.lineWidth = barWidth
        progressLayer?.strokeColor = fillColor.cgColor
        
        if let progresslayer = progressLayer {
            layer.addSublayer(progresslayer)
//            self.addGradient()
        }
    }
    
    private func addGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [Color.lightSkyTypeColor, Color.lightBlueTypeColor]
        gradient.frame = bounds
        gradient.mask = progressLayer
        layer.addSublayer(gradient)
    }
}
