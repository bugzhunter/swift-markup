public class Layout {
    
    func manage(view: UIView, parent: UIView?,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil) {
            
            view.translatesAutoresizingMaskIntoConstraints = false
            //manage width
            if let width = width {
                let widthConstraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: width)
                view.addConstraint(widthConstraint)
            }
            else if let percentWidth = percentWidth, parent = parent {
                let widthMultiplier = percentWidth / 100
                let leftConstraint = NSLayoutConstraint(item: view, attribute: .Left, relatedBy: .Equal, toItem: parent, attribute: .Left, multiplier: 1, constant: 0)
                let rightConstraint = NSLayoutConstraint(item: view, attribute: .Right, relatedBy: .Equal, toItem: parent, attribute: .Right, multiplier: widthMultiplier, constant: 0)
                parent.addConstraint(leftConstraint)
                parent.addConstraint(rightConstraint)
            }
            
            //manage height
            if let height = height {
                let heightConstraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: height)
                view.addConstraint(heightConstraint)
            }
            else if let percentHeight = percentHeight, parent = parent {
                let heightMultiplier = percentHeight / 100
                let topConstraint = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: parent, attribute: .Top, multiplier: 1, constant: 0)
                let bottomConstraint = NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: parent, attribute: .Bottom, multiplier: heightMultiplier, constant: 0)
                parent.addConstraint(topConstraint)
                parent.addConstraint(bottomConstraint)
                
            }
            
            //manage box
            if let top = top, parent = parent {
                let constraint = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: parent, attribute: .Top, multiplier: 1, constant: top)
                parent.addConstraint(constraint)
            }
            if let right = right, parent = parent {
                let constraint = NSLayoutConstraint(item: view, attribute: .Right, relatedBy: .Equal, toItem: parent, attribute: .Right, multiplier: 1, constant: right)
                parent.addConstraint(constraint)
            }
            if let bottom = bottom, parent = parent {
                let constraint = NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: parent, attribute: .Bottom, multiplier: 1, constant: bottom)
                parent.addConstraint(constraint)
            }
            if let left = left, parent = parent {
                let constraint = NSLayoutConstraint(item: view, attribute: .Left, relatedBy: .Equal, toItem: parent, attribute: .Left, multiplier: 1, constant: left)
                parent.addConstraint(constraint)
            }
    }
    
}