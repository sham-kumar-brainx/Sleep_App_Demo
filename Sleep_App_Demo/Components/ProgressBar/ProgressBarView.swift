//
//  ProgressBarView.swift
//  Medesto
//
//  Created by BrainX IOS on 16/06/2021.
//  Copyright © 2021 BrainX Technologies. All rights reserved.
//

import UIKit

enum ProgressBarStyle {
    case rounded
    case square
}

class ProgressBarView: UIView {
    
    // MARK: - Instance Properties
    
    var progressBarColor: UIColor = Color.filledHorizentalProgressBar
    var progressBackgroundColor: UIColor = Color.emptyHorizentalProgressBar
    var style: ProgressBarStyle = .rounded
    var progress: Double = 0.0 {
        didSet {
            updateProgress(progress)
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var progressWidthCnst: NSLayoutConstraint!
    
    
    // MARK: - Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

}

// MARK: - Private Methods

private extension ProgressBarView {
    
    // MARK: Initial Setup
    
    private func commonInit() {
        
        guard let contentView = self.loadFromNib() else {
            fatalError("Failed to load nib", file: #file, line: #line)
        }
        addSubview(contentView)
        contentView.fixInView(self)
        
        contentView.backgroundColor = progressBackgroundColor
        progressBarView.backgroundColor = progressBarColor
        
        guard style == .rounded else { return }
        
        let height = contentView.bounds.height
        
        progressBarView.setCornerRadius(height/2)
        
    }
    
    private func updateProgress(_ progess: Double) {
        progressWidthCnst = progressWidthCnst.changeMultiplier(multiplier: CGFloat(progress))
        progressWidthCnst.isActive = true
    }
}
