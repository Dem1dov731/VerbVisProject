import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView! // отображает сцену AR на экране
    
    var anchorMan: ManPuppet.SceneBase! // базовая модель, созданная в Reality Composer
    var isBaseButtonTapped = false // флаг для отслеживания нажатия на кнопку Base
    
    override func viewDidLoad() { // вызывается при загрузке представления
        super.viewDidLoad() // вызов родительского метода
    }
    
    @IBAction func WalkOverTapped(_ sender: Any) { // метод вызывается при нажатии кнопки WalkOver
        anchorMan.notifications.walkOver.post() // вызывает действие walkOver модели anchorMan
    }
    
    @IBAction func PickUpTapped(_ sender: Any) { // метод вызывается при нажатии кнопки PickUp
        anchorMan.notifications.pickUpReaction.post() // вызывает действие pickUpReaction модели anchorMan
    }
    
    @IBAction func StandUpTapped(_ sender: Any) { // метод вызывается при нажатии кнопки StandUp
        anchorMan.notifications.standUpReact.post() // вызывает действие standUpReact модели anchorMan
    }
    
    @IBAction func SitDownTapped(_ sender: Any) { // метод вызывается при нажатии кнопки SitDown
        anchorMan.notifications.sitDownReaction.post() // вызывает действие sitDownReaction модели anchorMan
    }
    
    @IBAction func LookOverTapped(_ sender: Any) { // метод вызывается при нажатии кнопки LookOver
        anchorMan.notifications.lookOverReaction.post() // вызывает действие lookOverReaction модели anchorMan
    }
    
    @IBAction func BaseTapped(_ sender: Any) { // метод вызывается при нажатии кнопки Base
        if !isBaseButtonTapped { // если флаг равен false
            anchorMan = try! ManPuppet.loadSceneBase() // загрузка базовой модели из Reality Composer
            anchorMan.generateCollisionShapes(recursive: true) // создание коллизий для модели
            arView.scene.anchors.append(anchorMan) // добавление модели на сцену AR
            isBaseButtonTapped = true // установка флага в true
            let button = sender as! UIButton // приведение отправителя к типу UIButton
            button.setTitle("Base loaded", for: .normal) // изменение заголовка кнопки на "Base loaded"
        }
        anchorMan.notifications.baseReact.post() // вызывает действие baseReact модели anchorMan
    }
}
