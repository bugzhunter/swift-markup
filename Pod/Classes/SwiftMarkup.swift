public class SwiftMarkup {
    
    public typealias ContentBlock = () -> Void
    
    private static var topView: UIView?
    private static let layout = Layout()
    
    
    public class func setRootView(view: UIView) {
        topView = view
    }
    
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
        content: ContentBlock? = nil) -> UIView {
            
            let view = ViewClass.init()
            topView?.addSubview(view)

            
            manageBackground(view, backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB)
            
            layout.manage(view, parent: topView,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left
            )
            
            addContent(content, toView: view)
            return view
    }
    
    public class func createElement(ButtonClass: UIButton.Type,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        title: String? = nil, touchUpInside: (target: AnyObject, action: Selector)? = nil) -> UIButton {
            
            let button = ButtonClass.init()
            topView?.addSubview(button)
            
            layout.manage(button, parent: topView,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left
            )
            
            if let title = title {
                button.setTitle(title, forState: .Normal)
            }
            if let touchUpInside = touchUpInside {
                button.addTarget(touchUpInside.target, action: touchUpInside.action, forControlEvents: .TouchUpInside)
            }
            
            return button
    }
    
    public class func createElement(TableViewClass: UITableView.Type, inout id: UITableView?,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
        dataSource: UITableViewDataSource? = nil, delegate: UITableViewDelegate? = nil) -> UITableView {
            
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
            
            return tableView
    }
    
    public class func addContent(content: ContentBlock?, toView view: UIView) {
        let savedTopView = topView
        topView = view
        content?()
        topView = savedTopView
    }
    
    private class func manageBackground(view: UIView, backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil) {
        if let backgroundColor = backgroundColor {
            view.backgroundColor = backgroundColor
        }
        if let rgb = backgroundColorRGB {
            view.backgroundColor = UIColor.fromRGB(rgb)
        }
    }        
    
}

