import UIKit

class CircularProgressBarView: UIView {
    
    
    // MARK: - Private Properties
    private var barWidth: CGFloat = 0
    private var barStyle: CAShapeLayerLineCap = .square
    private var progress: CGFloat = 0
    private var startAngle: CGFloat = -.pi / 2.0
    private var endAngle:CGFloat = 3 * .pi / 2
    private var barLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
//        configureViewsOnLoad()
    }
    
    // MARK: - Private Methods
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
        barLayer?.strokeColor = UIColor.white.cgColor
        guard let barLayer = barLayer else  { return }
        layer.addSublayer(barLayer)
    }
    
    // MARK: - Internal Methods
    func updateCircularProgressBarWith(totalHoursSlept: Float, totalHourToSleep: Float, color: UIColor, width: CGFloat = 9.0) {
        progress = CGFloat(totalHoursSlept / totalHourToSleep)
        barWidth = width
        configureViewsOnLoad()
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
        progressLayer?.strokeColor = color.cgColor
        guard let progressLayer = progressLayer else { return }
        layer.addSublayer(progressLayer)
    }
}
