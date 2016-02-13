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
        width: CGFloat? = nil, height: CGFloat? = nil,
        percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorARGB: UInt? = nil,
        content: ContentBlock? = nil) {
            
            let view = ViewClass.init()
            
            if let topView = topView {
                topView.addSubview(view)
            }
            
            //TODO avoid possible code duplication
            let savedTopView = topView
            topView = view
            content?()
            topView = savedTopView
            
            if let backgroundColor = backgroundColor {
                view.backgroundColor = backgroundColor
            }
            if let argb = backgroundColorARGB {
                view.backgroundColor = UIColor.colorFromARGB(argb)
            }
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