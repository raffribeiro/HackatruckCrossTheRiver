
import SpriteKit

class GameScene: SKScene {
    
    // instancia de GameViewController - geralmente é 1 só
    var gameController: GameViewController!
    
    // Declaração do background da scene
    var background: SKSpriteNode!
    
    // instancia do personagem
    var personagem: SKSpriteNode!
    
    // instancia da ponte
    
    //instancia de objetos
    var machado: SKSpriteNode!
    var arvore: SKSpriteNode!
    
    // instancia variavel de controle de toque
    var toqueObjetoOpcao = false
    
    /* Método que é chamado somente uma vez - quando o jogo é aberto */
    override func didMoveToView(view: SKView) {
        // chama método de criar a scene
        montaScene()
        personagemEntrando()
    }
    
    /* Método que é chamado toda vez que toca na tela */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // pega primeiro toque
        let touch = touches.first
        // pega localizaçao do toque
        let touchLocation = touch!.locationInNode(self)
        // armazena como node
        let toque = self.nodeAtPoint(touchLocation)
        
        if toque.name == "machado" {
            toqueObjetoOpcao = true
        }
        
        if toque.name == "arvore" && toqueObjetoOpcao == true{
            print("ARVORE")
            toqueObjetoOpcao = false
            
            // animação arvore caindo
            let trocaArvore = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore09")
                self.arvore.position = CGPoint(x: 500, y: 300)
                self.arvore.size = CGSize(width: 1000, height: 500)
            })
            
            arvore.runAction(trocaArvore)
            
        }
        
    }
    
    /* Método responsável por criar a scene */
    func montaScene(){
        
        // instancia o SKSPriteNode dizendo que imagem ele irá usar
        background = SKSpriteNode(imageNamed: "fundo")
        machado = SKSpriteNode(imageNamed: "num1")
        arvore = SKSpriteNode(imageNamed:"arvore01")
        
        // seta a posiçao em z desse node, lembrando que em SpriteKit os nodes na scene sempre estão em camadas
        background.zPosition = 1
        machado.zPosition = 1
        arvore.zPosition = 1
        
        
        // setar nome das variáveis
        background.name = "fundo"
        machado.name = "machado"
        arvore.name = "arvore"
        
        // seta o tamanho que esse node terá
        background.size = CGSize(width: 1050, height: 800)
        machado.size = CGSize(width: 50, height: 50)
        arvore.size = CGSize(width: 100, height: 550)
        
        // seta a posição que esse node estará na scene
        background.position = CGPoint(x: 510, y: 400)
        machado.position = CGPoint(x: 200, y: 730)
        arvore.position = CGPoint(x: 850, y: 500)
        
        // adiciona o node na scene
        addChild(background)
        addChild(machado)
        addChild(arvore)
        
        personagem = SKSpriteNode(imageNamed: "personagemChegada05")
        personagem.zPosition = 1
        personagem.name = "personagemEntrando"
        personagem.size = CGSize(width: 100, height: 100)
        personagem.position = CGPoint(x: 1100, y: 300)
        
        addChild(personagem)

        
    }
    
    func personagemEntrando(){
       
        let esperar = SKAction.waitForDuration(2)
        let andar = SKAction.moveToX(900, duration: 1)
        
        let sequence = SKAction.sequence([esperar, andar])
        personagem.runAction(sequence)
        
    }
}
