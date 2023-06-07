import UIKit
import RealmSwift

class HalfModalViewController: UIViewController {
    @IBOutlet var modalImage: UIImageView!
    @IBOutlet var modalTitle: UILabel!
    @IBOutlet var modalText: UILabel!
    
    var annotation: CustomMKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        if let annotation = annotation, let postData = annotation.postData {
            modalImage.image = UIImage(data: postData.imageData!)
            modalTitle.text = postData.title
            modalText.text = postData.text
        }
    }
}
