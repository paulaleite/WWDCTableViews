import UIKit

public class MasterTVCell: UITableViewCell {
    var reason: Reason? {
        didSet {
            reasonImage.image = reason?.reasonImage
            reasonTextLabel.text = reason?.reasonText
            reasonDescriptionLabel.text = reason?.reasonDescription
        }
    }
    
    public let reasonTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    public let reasonDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    public let reasonImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "beauty.png"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(reasonImage)
        addSubview(reasonTextLabel)
        addSubview(reasonDescriptionLabel)
        
        reasonImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 80, height: 0, enableInsets: false)
        reasonTextLabel.anchor(top: topAnchor, left: reasonImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        reasonDescriptionLabel.anchor(top: reasonTextLabel.bottomAnchor, left: reasonImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
