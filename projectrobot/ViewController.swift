import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
 
    var anchorMan : ManPuppet.SceneBase! // Создаем переменную модель-AR из Reality Composer с загрузкой базовой сцены

    override func viewDidLoad() {
        super.viewDidLoad()
      
        anchorMan = try! ManPuppet.loadSceneBase()  // этот код пытаеся инициировать при включении приложения модельку на горизонтальной поверхности
        anchorMan.generateCollisionShapes(recursive: true) // описанное выше
        arView.scene.anchors.append(anchorMan) // ARView включает сцену с anchor-ом
      
        
        
    }
    
    // Кнопки. Каждая кнопка отсылает "уведомление" в формате Движение.post()
    
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
        anchorMan.notifications.baseReact.post()
    }
}
