
// MARK: Generics

public class $<ElementType where ElementType: UIView> {
    
    public private(set) var element: ElementType!
    
    public init(
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil) {
            
            element = SwiftMarkup.createElement(ElementType.self,
                width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                top: top, right: right, bottom: bottom, left: left,
                backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB) as? ElementType
            
            
    }
    
    public init(title: String,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        touchUpInside: (target: AnyObject, action: Selector)? = nil) {
            
            if let ButtonClass = ElementType.self as? UIButton.Type {
                element = SwiftMarkup.createElement(ButtonClass,
                    width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                    top: top, right: right, bottom: bottom, left: left,
                    title: title, touchUpInside: touchUpInside) as? ElementType
            }
            
    }
    
    public init(inout id: UITableView?, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate? = nil,
        width: CGFloat? = nil, height: CGFloat? = nil, percentWidth: CGFloat? = nil, percentHeight: CGFloat? = nil,
        top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil,
        backgroundColor: UIColor? = nil, backgroundColorRGB: UInt? = nil) {
            
            if let TableViewClass = ElementType.self as? UITableView.Type {
                element = SwiftMarkup.createElement(TableViewClass, id: &id,
                    width: width, height: height, percentWidth: percentWidth, percentHeight: percentHeight,
                    top: top, right: right, bottom: bottom, left: left,
                    backgroundColor: backgroundColor, backgroundColorRGB: backgroundColorRGB,
                    dataSource: dataSource, delegate: delegate) as? ElementType
            }
        
    }
    
}

// MARK: Custom Operators

postfix operator /> {}

public postfix func /> <T> (wrapper: $<T>) -> T {
    return wrapper.element
}

public func >> (left: $<UIView>, right: SwiftMarkup.ContentBlock) {
    SwiftMarkup.addContent(right, toView: left.element)
}

public func >> (left: UIView, right: SwiftMarkup.ContentBlock) {    
    SwiftMarkup.addContent(right, toView: left)
}