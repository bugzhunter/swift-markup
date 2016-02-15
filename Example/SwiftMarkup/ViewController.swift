import UIKit
import SwiftMarkup

class ViewController: UIViewController, UITableViewDataSource {

    weak var tableView: UITableView?
    
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
    
    func buttonPushed() {
        print("and then just touch me")
        tableView?.backgroundColor = UIColor.redColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath)
        cell.textLabel?.text = indexPath.row.description
        cell.backgroundColor = UIColor.clearColor()
        return cell;
    }

}

