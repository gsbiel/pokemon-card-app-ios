//
//  ViewController.swift
//  Poke3D
//
//  Created by user161182 on 2/4/20.
//  Copyright © 2020 user161182. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        // Nesse modo de configuracao, nao queremos que o iPhone mapeie o ambiente 3D onde esta inserido. Queremos que o iPhone busuqe no ambiente por imagens que vamos inserir na pasta Assets.xcassets, e tomar acoes sempre que encontrar algo que corresponda a elas no mundo real.
        let configuration = ARImageTrackingConfiguration()
        
        // Dentro da pasta Assets.xcassets, criamso uma pasta do tipo "AR Resources Group". Essa pasta serve para colocarmos imagens que serao detectadsa pelo AR no mundo real. No metodo abaixo, passamos o nome dela para que seja criada uma referencia.
        guard let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Cards", bundle: Bundle.main) else {
            fatalError("There were no AR Resource Group named Pokemon Cards")
        }
        
        // Passamos a referencia do AR Resource Group para o gerenciador de Sessao da realidade aumentada
        configuration.trackingImages = imageToTrack
        
        configuration.maximumNumberOfTrackedImages = 1
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
