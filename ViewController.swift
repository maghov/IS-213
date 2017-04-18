//
//  ViewController.swift
//  QRCodeGenerator
//
//  Created by John Jensen on 18/04/2017.
//  Copyright © 2017 John Jensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var imageDisplay: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateBarcode(_ sender: Any) {
        imageDisplay.image = generateBarcodeFromString(string: tfInput.text!)
    }
    
    @IBAction func generateQRCode(_ sender: Any) {
        imageDisplay.image = generateQRCodeFromString(string: tfInput.text!)
    }
    
    func generateBarcodeFromString(string : String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        
        filter?.setValue(data, forKey : "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let output = filter?.outputImage?.applying(transform)
        if(output != nil) {
            return UIImage(ciImage: output!)
        }
        return nil;
    }
    func generateQRCodeFromString(string : String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey : "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let output = filter?.outputImage?.applying(transform)
        if(output != nil) {
            return UIImage(ciImage: output!)
        }
        return nil;
    }
}
