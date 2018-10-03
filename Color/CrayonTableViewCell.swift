import UIKit

class CrayonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var swatchView: UIView!
    
    weak var delegate: CrayonTableViewCellDelegate?
    
    
    @IBAction func toggleAppreciation(_ sender: Any) {
        delegate?.tappedLikedButton(on: self)
    }
    
}
