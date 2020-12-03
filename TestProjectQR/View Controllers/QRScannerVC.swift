//
//  QRScannerVC.swift
//  TestProjectQR
//
//  Created by Валентин Петруля on 29.11.2020.
//  Copyright © 2020 Валентин Петруля. All rights reserved.
//

import UIKit
import AVFoundation

class QRScannerVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var data: ItemsData?
    
    var video = AVCaptureVideoPreviewLayer()
    var session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setupVideoSession()
        setupNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        session.startRunning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        session.stopRunning()
    }

   private func setupVideoSession() {
        session = AVCaptureSession()
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)

        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch {
            print("error")
        }

        let output = AVCaptureMetadataOutput()
        session.addOutput(output)

        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]

        video = AVCaptureVideoPreviewLayer(session: session)
        let guide = view.safeAreaLayoutGuide
        video.frame = guide.layoutFrame
        video.videoGravity = .resizeAspectFill
        view.layer.addSublayer(video)
        
        session.startRunning()
    }
    
    private func setupNavigationBarItems() {
        let title = UILabel()
        title.text = "QR Scanner"
        title.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(0.2))
        navigationItem.titleView = title
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        self.session.stopRunning()
        if metadataObjects.count > 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr {
                    guard let code = object.stringValue else { return }
                    
                    if Int(code) == nil {
                        
                        let alert = UIAlertController(title: "Warning!", message: "Code must be integer!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                            self.session.startRunning()
                        }))
                        present(alert, animated: true, completion: nil)
                    } else {
                        
                        let alert = UIAlertController(title: "Do you want to change item's code?", message: "Code: \(code)", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
                            self.session.startRunning()
                        }))
                        
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                            let vc = ChangeCodeVC()
                            vc.code = code
                            vc.data = self.data
                            self.navigationController?.pushViewController(vc, animated: true)
                        }))
                        
                        present(alert, animated: true, completion: nil)
                        
                    }
                    
                }
            }
        }
    }
    
}
