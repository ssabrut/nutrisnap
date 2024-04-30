//
//  CameraModule.swift
//  NutriSnap
//
//  Created by Michael Eko on 30/04/24.
//

import Foundation
import AVFoundation

class CameraModule {
    private func openCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.setupCaptureSession()
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                if granted {
                    print("The user has granted access to camera!")
                    DispatchQueue.main.async {
                        self.setupCaptureSession()
                    }
                } else {
                    print("The user has not granted access to camera!")
                    self.handleDismiss()
                }
            }
            
        case .restricted:
            print("The user can't give access to camera due to some restriction!")
            self.handleDismiss()
            
        case .denied:
            print("The user has denied to access camera!")
            self.handleDismiss()
            
        @unknown default:
            print("Something has wrong due to don't have access to camera!")
            self.handleDismiss()
        }
    }

    private func setupCaptureSession() {
        let captureSession = AVCaptureSession()
        let photoOutput = AVCapturePhotoOutput()
        
        if let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) {
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                if captureSession.canAddInput(input) {
                    captureSession.addInput(input)
                }
            } catch let error {
                print("Error:", error)
            }
            
            if captureSession.canAddOutput(photoOutput) {
                captureSession.addOutput(photoOutput)
            }
            
            let cameraLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        }
    }
    
    private func handleDismiss() {
        
    }
}
