import UIKit

class CrayonModel: NSObject, UITableViewDataSource, CrayonTableViewCellDelegate {

    
    var crayons: [Crayon] = []

    override init() {
        for name in crayonDictionary.keys {
            let color = crayonDictionary[name]!
            crayons.append(Crayon(name: name, color: color))
        }
    }
    
    weak var tableView: UITableView?
    
    func tappedLikedButton(on cell: CrayonTableViewCell) {
        guard let indexPath = tableView?.indexPath(for: cell)
            else { fatalError("Non-existent cell!!??") }
        
        crayons[indexPath.row].isLiked.toggle()
        cell.likeButton.alpha = crayons[indexPath.row].isLiked ? 1.0 : 0.33
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.tableView = tableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    let reuseIdentifier = "cell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? CrayonTableViewCell else {
            fatalError("Could not instantiate guaranteed cell type")
        }
        
        cell.delegate = self
        let crayon = crayons[indexPath.row]
        cell.nameLabel.text = crayon.name
        cell.swatchView.backgroundColor = crayon.color
        let title = "❤️"
        cell.likeButton?.setTitle(title, for: .normal)
        cell.likeButton.alpha = crayons[indexPath.row].isLiked ? 1.0 : 0.33
        
        return cell
    }
}
