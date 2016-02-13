import UIKit
import SwiftMarkup

class ViewController: UIViewController, UITableViewDataSource {

    weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftMarkup.setAsRoot(view) {
            SwiftMarkup.createElement(UIView.self, percentWidth: 100, height: 200, backgroundColorARGB: 0x74c2e1) {
////                SwiftMarkup.createElement(UIButton, centerX: 0, centerY = -10, title: "Push me", eventHandler: (event: .TouchUpInside, handler: self.buttonPushed))
            }
////            SwiftMarkup.createElement(UIView, width: 100%, top: 200, right: 0, bottom: 0, left: 0, backgroundColor: UIColor.grayColor()) {
////                SwiftMarkup.createElement(UITableView, width: 100%, height: 100%, dataSource: self)
////            }
        }
    }
    
    func buttonPushed() {
        print("and then just touch me")
        tableView.backgroundColor = UIColor.redColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath)
        cell.textLabel?.text = indexPath.description
        return cell;
    }

}

