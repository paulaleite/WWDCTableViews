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
        reasonsProtocol.append(Reason(reasonText: "They're pretty.", reasonImage: UIImage(named: "beauty.png")!, reasonDescription: "Let's go check some out!", explanation: "Cooking apps rule at this, they transform their tables into Cards and make them super pretty!\nIt's really cool to try and play around with positioning of texts and images in order to make a table view that will support you're apps' identity. Ok, maybe that didn't make sense. I mean that you can make you're app look more professional or even playful, depending on the way you use adapt the table view.\nCooler than that even, you can always insert a table view into a normal view, integrating it into your app in a fluid way."))
        reasonsProtocol.append(Reason(reasonText: "They're everywhere.", reasonImage: UIImage(named: "world.png")!, reasonDescription: "Do you have any ideas where?", explanation: "Have you ever heard of social media?\nWell, I think you have! Almost every single one adapts table views to the way they want them to be.\nNow, lets think up a simpler example than that even. Open up your Messages app, or Settings, or Alarm, or Weather, or AppStore. Do you believe me now that they're everywhere?\nNot just that, but these are all examples of great usage of table views, aren't they all pretty?"))
        reasonsProtocol.append(Reason(reasonText: "They're useful.", reasonImage: UIImage(named: "useful.png")!, reasonDescription: "We happen to use them all the time.", explanation: "With table views, you can easily transform you're app. You saw how many different apps use them and how pretty they can be, but they're also very pratical. They're one of the first things you'll learn when programming for iOS and they'll stick with you forever. \nDon't know what to do? Make table views!\nBut it's not just that, they are crazy diverse. You can make them with Storyboard, SwiftUI, Programatically and they easily adapt from one device to the other!!!"))
        reasonsProtocol.append(Reason(reasonText: "I just do.", reasonImage: UIImage(named: "love.png")!, reasonDescription: "Do I need more reasons? Hahha", explanation: "I have so much fun making them, I happen to have a lot of apps that play around with table views and all of their potential! Check out other ways to have fun with table views, which basicaly means, have fun making apps.\nThe secret is: imagination.\nYou can probabily turn what you picture into a table view, programming!"))
    }
}

