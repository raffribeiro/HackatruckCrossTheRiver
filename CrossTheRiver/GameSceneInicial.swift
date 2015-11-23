
import SpriteKit

class GameSceneInicial: SKScene {
    
    var gameController: GameViewController!
    
    // ponte
    var ponte: SKSpriteNode!
    
    /* Método que é chamado somente uma vez - quando o jogo é aberto */
    override func didMoveToView(view: SKView) {
        // chama método de criar a scene
        montaScene()
        
    }
    
    /* Método que é chamado toda vez que toca na tela */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // pega primeiro toque
        let touch = touches.first
        // pega localizaçao do toque
        let touchLocation = touch!.locationInNode(self)
        // armazena como node
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "ponteInteira" {
            var gameScene = GameScene()
            self.view?.presentScene(gameScene)
        }
    }
    
    /* Método responsável por criar a scene */
    func montaScene(){
        
        ponte = SKSpriteNode(imageNamed: "ponte01")
        ponte.zPosition = 1
        ponte.name = "ponteInteira"
        ponte.size = CGSize(width: 1000, height: 200)
        ponte.position = CGPoint(x: 500, y: 500)
        
        addChild(ponte)
    }
    
}
