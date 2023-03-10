//
//  ARStatsView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/10/23.
//

import SwiftUI
import RealityKit

struct ARStatsView: View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelCOnfirmedForPlacement: Model?
    
    
    let models: [Model] = {
        // Dynamically get model filenames using FileManager
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath,
              let files = try? filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        var availableModels : [Model] = []
        for filename in files where filename.hasSuffix("usdz"){
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }
        
        return availableModels
    } ()
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: $modelCOnfirmedForPlacement)
            
            if isPlacementEnabled {
                PlacementButtonView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, confirmedModel: $modelCOnfirmedForPlacement)
            } else {
                ModelPickerView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, models: models)
            }
        }
        .edgesIgnoringSafeArea(.top)

    }
       
        

}




struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        
//        let arView = ARView(frame: .zero)
//
        let arView = CustomARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = modelConfirmedForPlacement {

            if let modelEntity = model.modelEntity {
                print("DEBUG : Adding model to scene => \(model.modelName)")
                
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                uiView.scene.addAnchor(anchorEntity)
            }
            else {
                print("DEBUG: Unable to load modelEntity for => \(model.modelName)")
            }
            
            DispatchQueue.main.async {
                modelConfirmedForPlacement = nil
            }
        }
        
    }
    
}

struct ModelPickerView: View {
    @Binding var isPlacementEnabled : Bool
    @Binding var selectedModel: Model?
    @State var showPlayersCards: Bool = false
    var models: [Model]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(models) { model in

                    
                    Button(action: {
                        print("DEBUG: selected model with name: \(model.modelName)")
                        isPlacementEnabled = true
                        selectedModel = model
                    }) {
                        Image(uiImage: model.image )
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(.white)
                            .cornerRadius(12)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Button(action: {
                    showPlayersCards = true
                }){
                    Image(systemName: "eye")
                }
                
            }
        }
        .padding(20)
        .background(.black.opacity(0.5))
        
    }
}

// MARK: - PLACEMENTBUTTONVIEW
struct PlacementButtonView: View {
    @Binding var isPlacementEnabled : Bool
    @Binding var selectedModel: Model?
    @Binding var confirmedModel: Model?
    
    var body: some View {
        HStack {
            // MARK: - Cancel Button
            Button(action: {
                print("DEBUG: Model placement Cancel.")
                resetPlacementParameters()
                
            }){
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            // MARK: - Confirm Button
            Button(action: {
                print("DEBUG: Model placement Confirm.")
                confirmedModel = selectedModel
                resetPlacementParameters()
      
                
            }){
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }

        }
    }
    
    func resetPlacementParameters(){
        isPlacementEnabled = false
        selectedModel = nil
    }
}

#if DEBUG
struct ARStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ARStatsView()
    }
}
#endif


extension ModelPickerView {
    
    private var playerStatsCard: some View {
        VStack{
            HStack(alignment:  .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    imageSection
                    titleSection
                }
                
                VStack(spacing: 8) {
                    Text("Running Stats")
                    cancelButton
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y: 65)
            )
            .cornerRadius(10)
        }
    }
    
    private var imageSection: some View {
        ZStack{
                Image("watch")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
            
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
        
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Tom Brady")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Quarter Back")
                .font(.subheadline)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
    
    private var cancelButton: some View {
        Button(action: {
            showPlayersCards = false
        }) {
            Text("Cancel")
                .font(.headline)
                .frame(width: 125, height: 35)
            
        }
        .buttonStyle(.bordered)
    }

    
    
}
