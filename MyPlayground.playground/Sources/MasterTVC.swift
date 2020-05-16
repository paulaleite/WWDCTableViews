import UIKit

public class MasterTVC: UITableViewController {
    var reasonsProtocol: [Reason] = [Reason]()
    let cellID = "masterCell"
//    var reasons = ["they're pretty", "they're everywhere", "they're useful", "I do"]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Reasons why I love Table Views"
        createReasonArray()
        tableView.register(MasterTVCell.self, forCellReuseIdentifier: cellID)
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasonsProtocol.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MasterTVCell
        let currentLastItem = reasonsProtocol[indexPath.row]
        cell?.reason = currentLastItem
        
        guard let safeCell = cell else {
            return UITableViewCell()
        }

        return safeCell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else {
            return
        }
        
        let newVC = DetailVC()
        newVC.reason = reasonsProtocol[selectedRow]
        navigationController?.pushViewController(newVC, animated: true)
        
    }
    
    override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func createReasonArray() {
        reasonsProtocol.append(Reason(reasonText: "They're pretty.", reasonImage: UIImage(named: "beauty.png")!, reasonDescription: "Let's go check some out!"))
        reasonsProtocol.append(Reason(reasonText: "They're everywhere.", reasonImage: UIImage(named: "world.png")!, reasonDescription: "Do you have any idea?"))
        reasonsProtocol.append(Reason(reasonText: "They're useful.", reasonImage: UIImage(named: "useful.png")!, reasonDescription: "We happen to use them all the time."))
        reasonsProtocol.append(Reason(reasonText: "I just do.", reasonImage: UIImage(named: "love.png")!, reasonDescription: "Do I need more reasons? Hahha"))
    }
}

