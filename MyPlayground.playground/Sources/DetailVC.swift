import Foundation
import UIKit

public class DetailVC: UIViewController {
    var reason: Reason?
    
    override public func loadView() {
        guard let reasonTextSafe = reason?.reasonText else { return }
        title = reasonTextSafe
        view = UIImageView()
        view.backgroundColor = UIColor.white
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIImageView()
        background.image = UIImage(named: "background.png")
        background.frame = CGRect(x: 0, y: 40, width: 350, height: 600)
        
        let label = setText()

        
        view.addSubview(background)
        view.addSubview(label)

        let horizontalConstraintLabel = label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraintLabel = label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraintLabel = label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        let heightConstraintLabel = label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)
        
        view.addConstraints([horizontalConstraintLabel, verticalConstraintLabel, widthConstraintLabel, heightConstraintLabel])
    }
    
    public func setText() -> UILabel {
        guard let explanationTextSafe = reason?.explanation else { return UILabel() }
        
        let label = UILabel()
        label.text = explanationTextSafe
        label.font = UIFont.systemFont(ofSize: 24)
        
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}
