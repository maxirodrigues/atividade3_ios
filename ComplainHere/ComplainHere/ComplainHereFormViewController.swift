//
//  ComplainHereFormViewController.swift
//  ComplainHere
//
//  Created by User on 05/01/2022.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit

class ComplainHereFormViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textViewAddress: UITextView!
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var textViewResume: UITextView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    var complainHere: Complain?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let complainHere = complainHere {
            title = "Edição"
            textFieldName.text = complainHere.name
            textViewAddress.text = complainHere.address
            textViewResume.text = complainHere.resume
            if let image = complainHere.image{
                imageViewPhoto.image = UIImage(data: image)
            }
            buttonAddEdit.setTitle("Alterar", for: .normal)
        }

        }
    
    @IBAction func selectPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar foto", message: "De onde você deseja escolher a foto?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Câmera", style: .default) {_ in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de Fotos", style: .default) {_ in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let albumAction = UIAlertAction(title: "Álbum de Fotos", style: .default) {_ in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(albumAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style:.cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
}

func selectPicture(sourceType: UIImagePickerController.SourceType) {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = sourceType
    imagePicker.delegate = self
    present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func save(_ sender: UIButton) {
        if complainHere == nil {
            complainHere = Complain(context: context)
        }
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dated = formatter.string(from: now)
        
        complainHere?.name = textFieldName.text
        complainHere?.date = dated
        complainHere?.address = textViewAddress.text
        complainHere?.resume = textViewResume.text
        complainHere?.image = imageViewPhoto.image?.jpegData(compressionQuality: 0.9)
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)

    }
}

extension ComplainHereFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageViewPhoto.image = image
        }
    }
}
