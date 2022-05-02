//
//  UploadViewController.swift
//  InstaCloneAndFirebase
//
//  Created by Erge Gevher Akova on 1.05.2022.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var UploadComment: UITextField!
    @IBOutlet weak var btnUpload: UIButton!
    var utl = Utils()

    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImageView.isUserInteractionEnabled = true
        btnUpload.isEnabled = false
        
        let gestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        uploadImageView.addGestureRecognizer(gestureRecongnizer)
    }
    
    @objc func chooseImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.editedImage] != nil {
            uploadImageView.image = info[.editedImage] as? UIImage
            self.dismiss(animated: true)
            btnUpload.isEnabled = true
        }
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("media")
        
        if let data = uploadImageView.image?.jpegData(compressionQuality: 0.5) {
            let imageReferance = mediaFolder.child("image.jpg")
            imageReferance.putData(data, metadata: nil) { response, error in
                if error != nil {
                    self.present(self.utl.showBasicAlert(tit:"Error",msg: error?.localizedDescription ?? "error"), animated: true, completion: nil)
                }else{
                    imageReferance.downloadURL { url, error in
                        if error == nil{
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                }
            }
        }
    }
}
