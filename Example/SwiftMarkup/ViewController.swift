import UIKit
import SwiftMarkup

class ViewController: UIViewController, UITableViewDataSource {

    weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SwiftMarkup.setAsRoot(view) {
            SwiftMarkup.createElement(UIView.self, percentWidth: 100, height: 200, backgroundColorRGB: 0x74c2e1) {
                
                SwiftMarkup.createElement(UIButton.self,
                    percentWidth: 50, top: 50, title: "Push me",
                    targetActions: [(target: self, action: "buttonPushed", events: .TouchUpInside)])
                
            }
            SwiftMarkup.createElement(UIView.self, top: 200, right: 0, bottom: 0, left: 0) {
                
                SwiftMarkup.createElement(UITableView.self, id: &self.tableView,
                    percentWidth: 100, percentHeight: 100, backgroundColor: UIColor.lightGrayColor(), dataSource: self,
                    afterInit: {$0.registerClass(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")})
                
            }
        }
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

