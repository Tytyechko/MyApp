//
//  ViewControllerFirst.swift
//  BarCode&QRCode
//
//  Created by Yaroslav Tytechko on 1/18/18.
//  Copyright © 2018 iOSRevisited. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerSecond: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
 
    var videoCaptureDevice: AVCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    var device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    var output = AVCaptureMetadataOutput()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var captureSession = AVCaptureSession()
   var code: String?
    
     var scannedCode = UILabel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCamera()
        self.addLabelForDisplayingCode()
        addButton()
        addButtonAdd()
        
    }
 
    
    private func setupCamera() {
        
        let input = try? AVCaptureDeviceInput(device: videoCaptureDevice)
        
        if self.captureSession.canAddInput(input) {
            self.captureSession.addInput(input)
        }
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        if let videoPreviewLayer = self.previewLayer {
            videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer.frame = self.view.bounds
            view.layer.addSublayer(videoPreviewLayer)
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if self.captureSession.canAddOutput(metadataOutput) {
            self.captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode]
            
        } else {
            print("Could not add metadata output")
        }
    }
    
    private func addLabelForDisplayingCode() {
        view.addSubview(scannedCode)
        scannedCode.translatesAutoresizingMaskIntoConstraints = false
        scannedCode.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
        scannedCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        scannedCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        scannedCode.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scannedCode.font = UIFont.preferredFont(forTextStyle: .title2)
        scannedCode.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        scannedCode.textAlignment = .center
        scannedCode.textColor = UIColor.white
        scannedCode.text = "Scanning...."
    }
    
    private func addButton() {
        let button   = UIButton(type: UIButtonType.system) as UIButton
        button.frame = CGRect(x: 20, y: 40, width: 30, height: 30)
//        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setImage(UIImage(named: "closeButton.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(ViewControllerSecond.playTapped), for:.touchUpInside)
        self.view.addSubview(button)
        
    }
    @objc func playTapped() {
        dismiss(animated: true, completion: nil)
    }
    private func addButtonAdd() {
        let button   = UIButton(type: UIButtonType.system) as UIButton
        button.frame = CGRect(x: self.view.frame.size.width-40, y: 43, width: 40, height: 40)
        //        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setImage(UIImage(named: "addChannelButton.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(ViewControllerSecond.addTapped), for:.touchUpInside)
        self.view.addSubview(button)
        
    }
    @objc func addTapped() {
        performSegue(withIdentifier: "Goooooo", sender: self)
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
             destination.name = scannedCode.text
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession.isRunning == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession.isRunning == true) {
            captureSession.stopRunning();
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        // This is the delegate'smethod that is called when a code is readed
        
//        print(metadataObjects)
        for metadata in metadataObjects {
            let readableObject = metadata as! AVMetadataMachineReadableCodeObject
            let code = readableObject.stringValue
            scannedCode.text = code
             print(scannedCode)
        }
    }
}




