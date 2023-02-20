import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var anchorMan: ManPuppet.SceneBase!
    var isBaseButtonTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Не загружаем базовую модель здесь
    }
    
    @IBAction func WalkOverTapped(_ sender: Any) {
        anchorMan.notifications.walkOver.post()
    }
    
    @IBAction func PickUpTapped(_ sender: Any) {
        anchorMan.notifications.pickUpReaction.post()
    }
    
    @IBAction func StandUpTapped(_ sender: Any) {
        anchorMan.notifications.standUpReact.post()
    }
    
    @IBAction func SitDownTapped(_ sender: Any) {
        anchorMan.notifications.sitDownReaction.post()
    }
    
    @IBAction func LookOverTapped(_ sender: Any) {
        anchorMan.notifications.lookOverReaction.post()
    }
    
    @IBAction func BaseTapped(_ sender: Any) {
        if !isBaseButtonTapped {
            anchorMan = try! ManPuppet.loadSceneBase()
            anchorMan.generateCollisionShapes(recursive: true)
            arView.scene.anchors.append(anchorMan)
            isBaseButtonTapped = true
            let button = sender as! UIButton
            button.setTitle("Base loaded", for: .normal)
        }
        anchorMan.notifications.baseReact.post()
    }
}
