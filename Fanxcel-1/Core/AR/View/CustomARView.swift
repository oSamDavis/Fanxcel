//
//  CustomARView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/10/23.
//


import Foundation
import RealityKit
import FocusEntity
import Combine
import ARKit
import UIKit


class CustomARView: ARView {
    enum FocusStyleChoices {
        case classic
        case material
        case color
    }

    /// Style to be displayed in the example
    let focusStyle: FocusStyleChoices = .classic
    var focusEntity: FocusEntity?
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        self.setupConfig()

        switch self.focusStyle {
        case .color:
            self.focusEntity = FocusEntity(on: self, focus: .plane)
        case .material:
            do {
                let onColor: MaterialColorParameter = try .texture(.load(named: "Add"))
                let offColor: MaterialColorParameter = try .texture(.load(named: "Open"))
                self.focusEntity = FocusEntity(
                    on: self,
                    style: .colored(
                        onColor: onColor, offColor: offColor,
                        nonTrackingColor: offColor
                    )
                )
            } catch {
                self.focusEntity = FocusEntity(on: self, focus: .classic)
                print("Unable to load plane textures")
                print(error.localizedDescription)
            }
        default:
            self.focusEntity = FocusEntity(on: self, focus: .classic)
        }
    }

    func setupConfig() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        session.run(config)
    }

    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




// Contains everything we need to create a model and thumbnails
class Model : Identifiable {
    var id: String
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellables : AnyCancellable? = nil
    
    init(modelName: String) {
        self.id = UUID().uuidString
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        // asynchronously load model entities
        
        let filename = modelName + ".usdz"
        self.cancellables = ModelEntity.loadModelAsync(named: filename).sink(receiveCompletion: { loadCompletiom in
            // Handle Error
            print("DEBUG: Unable to load modelENtity for modelName: \(self.modelName)")
            
        }, receiveValue: { modelEntity in
            self.modelEntity = modelEntity
            print("DEBUG: Succesfully loaded modelENtity for modelName: \(self.modelName)")
        })
        
    }
    
}
