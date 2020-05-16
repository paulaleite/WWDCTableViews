import Foundation
import UIKit

public class DetailVC: UIViewController {
    var reason: Reason?
    
    override public func loadView() {
        guard let reasonTextSafe = reason?.reasonText else { return }
        title = reasonTextSafe
        view = UIView()
        view.backgroundColor = UIColor.white
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let label = setText()
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    public func setText() -> UILabel {
        let label = UILabel()
        label.text = "Hi, I'm testing this out!"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}
