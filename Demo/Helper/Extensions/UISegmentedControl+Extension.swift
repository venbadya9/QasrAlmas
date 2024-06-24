import Foundation
import UIKit

//MARK: UISegmentedControl

extension UISegmentedControl {
    
    func removeDivider() {
        guard let dividerColor = heavyMetal,
              let normalTextColor = pumice,
              let selectedTextColor = shamrock else { return }
        
        let background = UIImage.getSegRect(color: dividerColor.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(background, for: .normal, barMetrics: .default)
        self.setBackgroundImage(background, for: .selected, barMetrics: .default)
        self.setBackgroundImage(background, for: .highlighted, barMetrics: .default)
        
        let dividerLine = UIImage.getSegRect(color: dividerColor.cgColor, andSize: CGSize(width: 1.0, height: 5))
        self.setDividerImage(dividerLine, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: normalTextColor,
                                     NSAttributedString.Key.font: UIFont(name: matchFont, size: 13)!], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedTextColor,
                                     NSAttributedString.Key.font: UIFont(name: matchFont, size: 13)!], for: .selected)
    }
    
    func highlightSelectedSegment() {
        guard let selectedTextColor = shamrock else { return }
        removeDivider()
        let lineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let lineHeight: CGFloat = 3.0
        let lineXPosition = CGFloat(selectedSegmentIndex * Int(lineWidth))
        let lineYPosition = self.bounds.size.height - 4.0
        let underlineFrame = CGRect(x: lineXPosition, y: lineYPosition, width: lineWidth, height: lineHeight)
        let underLine = UIView(frame: underlineFrame)
        underLine.backgroundColor = selectedTextColor
        underLine.tag = 1
        self.addSubview(underLine)
    }
    
    func underlinePosition() {
        guard let underLine = self.viewWithTag(1) else {return}
        let xPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.5, delay: .zero, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            underLine.frame.origin.x = xPosition
        })
    }
}
