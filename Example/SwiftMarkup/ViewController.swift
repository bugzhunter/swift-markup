import UIKit
import SwiftMarkup

class ViewController: UIViewController, UITableViewDataSource {

    weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view >> {
            $<UIView>(percentWidth: 100, height: 200, backgroundColorRGB: 0x74c2e1) >> {
                $<UIButton>(title: "Push me", percentWidth: 100, top: 50,
                    touchUpInside: (target: self, action: "buttonPushed"))/>
            }
            $<UIView>(top: 200, right: 0, bottom: 0, left: 0) >> {
                $<UITableView>(id: &self.tableView, dataSource: self,
                    percentWidth: 100, percentHeight: 100, backgroundColor: UIColor.lightGrayColor())/>
            }
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






