//global aliases for SwiftMarkup class functions


public func element(ViewClass: UIView.Type,
    width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
    top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
    backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
    content: SwiftMarkup.ContentBlock? = nil) {
        
        SwiftMarkup.createElement(ViewClass,
            width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
            top: top, right: right, bottom: bottom, left: left,
            backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB,
            content: content)
}

public func element(ButtonClass: UIButton.Type,
    width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
    top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
    title: String? = nil, targetActions: [(target: AnyObject, action: Selector, events: UIControlEvents)]? = nil) {
        
        SwiftMarkup.createElement(ButtonClass,
            width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
            top: top, right: right, bottom: bottom, left: left,
            title: title, targetActions: targetActions)
}

public func element(TableViewClass: UITableView.Type, inout id: UITableView?,
    width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
    top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
    backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil,
    dataSource: UITableViewDataSource? = nil, delegate: UITableViewDelegate? = nil) {
        
        SwiftMarkup.createElement(TableViewClass, id: &id,
            width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
            top: top, right: right, bottom: bottom, left: left,
            backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB,
            dataSource: dataSource, delegate: delegate)
        
}