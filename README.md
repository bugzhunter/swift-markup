# SwiftMarkup

What if you could create your views in UIViewController in this way:
```xml
override func viewDidLoad() {
    super.viewDidLoad()

    <UIView width=100% height=200 backgroundColor=0x74c2e1>
        <UIButton width=100% top=50 title="Push me" touchUpInside=self.buttonPushed/>
    </UIView>
    <UIView top=200 right=0 bottom=0 left=0>
        <UITableView id=tableView width=100% height=100% 
            backgroundColor=UIColor.lightGrayColor() dataSource=self/>
    </UIView>

    tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
}
```

With SwiftMarkup you can work in a similar way (well, not 100% similar):
```swift
override func viewDidLoad() {
    super.viewDidLoad()

    SwiftMarkup.setRootView(view)

    element(UIView.self, percentWidth: 100, height: 200, backgroundColorRGB: 0x74c2e1) {
        element(UIButton.self, percentWidth: 100, top: 50, title: "Push me",
            touchUpInside: (target: self, action: "buttonPushed"))
    }
    element(UIView.self, top: 200, right: 0, bottom: 0, left: 0) {
        element(UITableView.self, id: &self.tableView,
            percentWidth: 100, percentHeight: 100, backgroundColor: UIColor.lightGrayColor(), dataSource: self)
    }

    tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
}
```

## Author

bugzhunter, bugzhunter@gmail.com

## License

SwiftMarkup is available under the MIT license. See the LICENSE file for more info.
