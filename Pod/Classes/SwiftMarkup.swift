public class SwiftMarkup {
    
    public typealias ContentBlock = () -> Void
    
    private static var topView: UIView?
    private static let layout = Layout()
    
    public class func createElement(view: UIView,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
        content: ContentBlock? = nil) {
            
            manageBackground(view, backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB)
            
            layout.manage(view, parent: topView,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left
            )
            
            addContent(content, toView: view)
            
    }
    
    public class func createElement(ViewClass: UIView.Type,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
        content: ContentBlock? = nil) {
            
            let view = ViewClass.init()
            topView?.addSubview(view)

            
            manageBackground(view, backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB)
            
            layout.manage(view, parent: topView,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left
            )
            
            addContent(content, toView: view)
            
    }
    
    public class func createElement(ButtonClass: UIButton.Type,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        title: String? = nil, targetActions: [(target: AnyObject, action: Selector, events: UIControlEvents)]? = nil) {
            
            let button = ButtonClass.init()
            topView?.addSubview(button)
            
            layout.manage(button, parent: topView,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left
            )
            
            if let title = title {
                button.setTitle(title, forState: .Normal)
            }
            if let actions = targetActions {
                for item in actions {
                    button.addTarget(item.target, action: item.action, forControlEvents: item.events)
                }
            }
    
    }
    
    public class func createElement(TableViewClass: UITableView.Type, inout id: UITableView?,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
        dataSource: UITableViewDataSource? = nil, delegate: UITableViewDelegate? = nil) {
            
            let tableView = TableViewClass.init()
            id = tableView
            topView?.addSubview(tableView)
            
            manageBackground(tableView, backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB)
            
            layout.manage(tableView, parent: topView,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left
            )
            
            if let dataSource = dataSource {
                tableView.dataSource = dataSource
            }
            if let delegate = delegate {
                tableView.delegate = delegate
            }
            
    }
    
    private class func manageBackground(view: UIView, backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil) {
        if let backgroundColor = backgroundColor {
            view.backgroundColor = backgroundColor
        }
        if let rgb = backgroundColorRGB {
            view.backgroundColor = UIColor.colorFromARGB(0xFF000000 + rgb)
        }
    }
    
    private class func addContent(content: ContentBlock?, toView view: UIView) {
        let savedTopView = topView
        topView = view
        content?()
        topView = savedTopView
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