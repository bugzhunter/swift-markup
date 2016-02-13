public class SwiftMarkup {
    
    private static var topView: UIView?
    public typealias ContentBlock = () -> Void
    
    public class func setAsRoot(rootView: UIView, content: ContentBlock) {
        let savedTopView = topView
        topView = rootView
        content()
        topView = savedTopView
    }
    
    public class func createElement(ViewClass: UIView.Type,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
        content: ContentBlock? = nil) {
            
            let view = ViewClass.init()
            //add to parent
            if let topView = topView {
                topView.addSubview(view)
            }
            
            //manage colors
            if let backgroundColor = backgroundColor {
                view.backgroundColor = backgroundColor
            }
            if let rgb = backgroundColorRGB {
                view.backgroundColor = UIColor.colorFromARGB(0xFF000000 + rgb)
            }
            
            //manage layout
            view.translatesAutoresizingMaskIntoConstraints = false
            //manage width
            if let width = width {
                let widthConstraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: width)
                view.addConstraint(widthConstraint)
            }
            else if let percentWidth = percentWidth, parent = topView {
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
            else if let percentHeight = percentHeight, parent = topView {
                let heightMultiplier = percentHeight / 100
                let topConstraint = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: parent, attribute: .Top, multiplier: 1, constant: 0)
                let bottomConstraint = NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: parent, attribute: .Bottom, multiplier: heightMultiplier, constant: 0)
                parent.addConstraint(topConstraint)
                parent.addConstraint(bottomConstraint)
                
            }
            
            //manage box
            if let top = top, parent = topView {
                let constraint = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: parent, attribute: .Top, multiplier: 1, constant: top)
                parent.addConstraint(constraint)
            }
            if let right = right, parent = topView {
                let constraint = NSLayoutConstraint(item: view, attribute: .Right, relatedBy: .Equal, toItem: parent, attribute: .Right, multiplier: 1, constant: right)
                parent.addConstraint(constraint)
            }
            if let bottom = bottom, parent = topView {
                let constraint = NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: parent, attribute: .Bottom, multiplier: 1, constant: bottom)
                parent.addConstraint(constraint)
            }
            if let left = left, parent = topView {
                let constraint = NSLayoutConstraint(item: view, attribute: .Left, relatedBy: .Equal, toItem: parent, attribute: .Left, multiplier: 1, constant: left)
                parent.addConstraint(constraint)
            }
            
            
            //TODO avoid possible code duplication
            let savedTopView = topView
            topView = view
            content?()
            topView = savedTopView

    }
    
    public class func createElement(ButtonClass: UIButton.Type) {
        //        let view = ViewClass.init()
        //
        //        if let topView = topView {
        //            topView.addSubview(view)
        //        }
        //
        //        //TODO avoid possible code duplication
        //        let savedTopView = topView
        //        topView = view
        //        content?()
        //        topView = savedTopView
    }
}

extension UIColor {
    public class func colorFromARGB(argb: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((argb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((argb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(argb & 0x0000FF) / 255.0,
            alpha: CGFloat((argb & 0xFF000000) >> 24) / 255.0
        )
    }
}