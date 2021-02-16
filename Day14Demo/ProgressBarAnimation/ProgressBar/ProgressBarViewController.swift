import UIKit

class ProgressBarViewController: UIViewController {
    
    let duration = 5.0
    let startAngle = CGFloat.pi * -1/2
    let endAngle = CGFloat.pi * 3/2
    let progressBarRadius: CGFloat = 100
    let lineWidth: CGFloat = 10
    var startTime = Date()
    let progressBar = CAShapeLayer()
    let percentDoneLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textAlignment = .center
        label.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 48)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let circularPath = UIBezierPath(arcCenter: view.center, radius: progressBarRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        
        progressBar.path = circularPath.cgPath
        progressBar.strokeColor = UIColor.red.cgColor
        progressBar.lineWidth = lineWidth
        progressBar.fillColor = UIColor.clear.cgColor
        progressBar.lineCap = CAShapeLayerLineCap.round
        progressBar.strokeEnd = 0
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(progressBar)
        view.addSubview(percentDoneLabel)
        
        percentDoneLabel.frame = view.frame
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(beginProgressAnimation)))
        
    }
    
    @objc private func beginProgressAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        progressBar.add(animation, forKey: "animationIdentifier")
        
        /// DisplayLink is used to synchronize the animation of the progressBar with the percentageDoneLabel
        let displayLink = CADisplayLink(target: self, selector: #selector(updateProgressLabel))
        displayLink.add(to: .main, forMode: .default)
        startTime = Date()
    }
    
    @objc func updateProgressLabel() {
        let now = Date()
        let elapseTime = now.timeIntervalSince(startTime)
        var percentageTime = elapseTime / (duration)
        if percentageTime > 1 {
            percentageTime = 1
        }
        let rounded = Int(percentageTime * 100)
        self.percentDoneLabel.text = "\(rounded)%"
        
    }
    
}
