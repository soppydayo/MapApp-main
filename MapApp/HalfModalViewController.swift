import UIKit
import RealmSwift

class HalfModalViewController: UIViewController, UIAdaptivePresentationControllerDelegate{
    @IBOutlet var modalImage: UIImageView!
    @IBOutlet var modalTitle: UILabel!
    @IBOutlet var modalText: UILabel!

    
    var annotation: CustomMKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        presentationController?.delegate = self
        
        if let sheet = presentationController as? UISheetPresentationController {
            sheet.prefersGrabberVisible = true
            
            modalText.roundCorners(cornerRadius: 10.0)

        }
    }
    
    func loadData() {
        if let annotation = annotation, let postData = annotation.postData {
            modalImage.image = UIImage(data: postData.imageData!)
            modalTitle.text = postData.title
            modalText.text = postData.text
        }
    }
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("モーダルが閉じられました")

        dismiss(animated: true, completion: nil)
    }
}

extension UILabel {
    func roundCorners(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}

