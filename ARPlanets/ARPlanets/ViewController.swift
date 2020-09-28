//
//  ViewController.swift
//  ARPlanets
//
//  Created by Adri on 25/09/2020.
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
        
        
        let moon = SCNSphere(radius: 0.02)
        let sun = SCNSphere(radius: 0.2)
        let mercury = SCNSphere(radius: 0.03)
        let venus = SCNSphere(radius: 0.07)
        let venusAtmosphere = SCNSphere(radius: 0.05)
        let jupiter = SCNSphere(radius: 0.15)
        let ring = SCNTorus(ringRadius: 1, pipeRadius: 0.25)
        let saturn = SCNSphere(radius: 0.14)
        let mars = SCNSphere(radius: 0.05)
        let uranus = SCNSphere(radius: 0.1)
        let neptune = SCNSphere(radius: 0.1)
        let earth = SCNSphere(radius: 0.07)
        let earthCloud = SCNSphere(radius: 0.07)
        
        
        
        let moonMaterial = SCNMaterial()
        let sunMaterial = SCNMaterial()
        let mercuryMaterial = SCNMaterial()
        let venusMaterial = SCNMaterial()
        let venusAtmosphereMaterial = SCNMaterial()
        let jupiterMaterial = SCNMaterial()
        let ringMaterial = SCNMaterial()
        let saturnMaterial = SCNMaterial()
        let marsMaterial = SCNMaterial()
        let uranusMaterial = SCNMaterial()
        let neptuneMaterial = SCNMaterial()
        let earthMaterial = SCNMaterial()
        let earthCloudMaterial = SCNMaterial()
        
        
        moonMaterial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        mercuryMaterial.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg")
        venusMaterial.diffuse.contents = UIImage(named: "art.scnassets/venus.jpg")
        venusAtmosphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/venus_atmosphere.jpg")
        jupiterMaterial.diffuse.contents = UIImage(named: "art.scnassets/jupiter.jpg")
        ringMaterial.diffuse.contents = UIImage(named: "art.scnassets/ring.jpg")
        saturnMaterial.diffuse.contents = UIImage(named: "art.scnassets/saturn.jpg")
        marsMaterial.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        uranusMaterial.diffuse.contents = UIImage(named: "art.scnassets/uranus.jpg")
        neptuneMaterial.diffuse.contents = UIImage(named: "art.scnassets/neptune.jpg")
        earthMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        earthCloudMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth_clouds.jpg")
        
        moon.materials = [moonMaterial]
        sun.materials = [sunMaterial]
        mercury.materials = [mercuryMaterial]
        venus.materials = [venusMaterial]
        venusAtmosphere.materials = [venusAtmosphereMaterial]
        jupiter.materials = [jupiterMaterial]
        ring.materials = [ringMaterial]
        saturn.materials = [saturnMaterial]
        mars.materials = [marsMaterial]
        uranus.materials = [uranusMaterial]
        neptune.materials = [neptuneMaterial]
        earth.materials = [earthMaterial]
        earthCloud.materials = [earthCloudMaterial]
        
        let moonNode = SCNNode()
        let sunNode = SCNNode()
        let mercuryNode = SCNNode()
        let venusNode = SCNNode()
        let venusAtmosphereNode = SCNNode()
        let jupiterNode = SCNNode()
        let saturnNode = SCNNode()
        let marsNode = SCNNode()
        let uranusNode = SCNNode()
        let neptuneNode = SCNNode()
        let earthNode = SCNNode()
        let earthCloudNode = SCNNode()
        let ringNode = SCNNode()
        
        earthCloudNode.opacity = 0.3
        
        
        sunNode.position = SCNVector3(x: 0.1, y: 0.1, z: -0.5)
        mercuryNode.position = SCNVector3(x: 0.2, y: 0.1, z: -0.9)
        venusNode.position = SCNVector3(x: 0.4, y: 0.1, z: -1.1)
        venusAtmosphereNode.position = SCNVector3(x: 0.4, y: 0.1, z: -1.1)
        earthNode.position = SCNVector3(x: 0.6, y: 0.1, z: -1.3)
        earthCloudNode.position = SCNVector3(x: 0.6, y: 0.1, z: -1.3)
        moonNode.position = SCNVector3(x: 0.68, y: 0.12, z: -1.39)
        marsNode.position = SCNVector3(x: 0.8, y: 0.1, z: -1.5)
        jupiterNode.position = SCNVector3(x: 1, y: 0.1, z: -1.7)
        saturnNode.position = SCNVector3(x: 1.2, y: 0.1, z: -2)
        ringNode.position = SCNVector3(x: 1.2, y: 0.1, z: -2)
        uranusNode.position = SCNVector3(x: 1.4, y: 0.1, z: -2.4)
        neptuneNode.position = SCNVector3(x: 1.6, y: 0.1, z: -2.8)
        
        
        let spin = CABasicAnimation(keyPath: "rotation")
        
        spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 0, w: 0))
        spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2*Double.pi)))
        spin.duration = 10
        spin.repeatCount = .infinity
        
        earthNode.addAnimation(spin, forKey: "spin around")
        earthCloudNode.addAnimation(spin, forKey: "spin around")
        
        moonNode.geometry = moon
        sunNode.geometry = sun
        mercuryNode.geometry = mercury
        venusNode.geometry = venus
        jupiterNode.geometry = jupiter
        ringNode.geometry = ring
        saturnNode.geometry = saturn
        marsNode.geometry = mars
        uranusNode.geometry = uranus
        neptuneNode.geometry = neptune
        earthNode.geometry = earth
        earthCloudNode.geometry = earthCloud
        
        earthNode.addChildNode(moonNode)
        
        
        sceneView.scene.rootNode.addChildNode(moonNode)
        sceneView.scene.rootNode.addChildNode(sunNode)
        sceneView.scene.rootNode.addChildNode(mercuryNode)
        sceneView.scene.rootNode.addChildNode(venusNode)
        sceneView.scene.rootNode.addChildNode(jupiterNode)
        sceneView.scene.rootNode.addChildNode(saturnNode)
        sceneView.scene.rootNode.addChildNode(ringNode)
        sceneView.scene.rootNode.addChildNode(marsNode)
        sceneView.scene.rootNode.addChildNode(uranusNode)
        sceneView.scene.rootNode.addChildNode(neptuneNode)
        sceneView.scene.rootNode.addChildNode(earthNode)
        sceneView.scene.rootNode.addChildNode(earthCloudNode)
        
        sceneView.autoenablesDefaultLighting = true
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

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
