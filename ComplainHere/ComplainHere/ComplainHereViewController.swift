//
//  ViewController.swift
//  ComplainHere
//
//  Created by User on 03/01/2022.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit

class ComplainHereViewController: UIViewController {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var textViewResume: UITextView!
    
    var complainHere: Complain?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let complainHereFormViewController = segue.destination as? ComplainHereFormViewController
        {
            complainHereFormViewController.complainHere = complainHere
        }
    }
    
    func prepareScreen(){
        if let complainHere = complainHere {
            if let image = complainHere.image{
                imageViewPhoto.image = UIImage(data: image)
            }
            labelName.text = complainHere.name
            labelAddress.text = complainHere.address
            textViewResume.text = complainHere.resume
        }
    }
    
}

