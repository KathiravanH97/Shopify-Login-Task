//
//  ViewController.swift
//  KathiravanVajroTask
//
//  Created by Mac on 20/01/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var lbl_Email: UILabel!
    @IBOutlet weak var lbl_Pwd: UILabel!
    @IBOutlet weak var txtFd_Email: UITextField!
    @IBOutlet weak var txFd_Pwd: UITextField!
    @IBOutlet weak var btn_Submit: UIButton!
    @IBOutlet weak var img_Profile: UIImageView!
    @IBOutlet weak var btn_Outlet: UIButton!
    var imagepicker = UIImagePickerController()
    var image1 : UIImage!
    
    var key = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_Email.layer.borderWidth = 1
        lbl_Pwd.layer.borderWidth = 1
        txtFd_Email.layer.borderWidth = 1
        txFd_Pwd.layer.borderWidth = 1
        btn_Outlet.layer.borderWidth = 1
        
        lbl_Email.layer.cornerRadius = 10
        lbl_Pwd.layer.cornerRadius = 10
        txtFd_Email.layer.cornerRadius = 20
        txFd_Pwd.layer.cornerRadius = 20
        btn_Outlet.layer.cornerRadius = 20

        let myColor : UIColor = UIColor.green
        lbl_Email.layer.borderColor = myColor.cgColor
        lbl_Pwd.layer.borderColor = myColor.cgColor
        txtFd_Email.layer.borderColor = myColor.cgColor
        txFd_Pwd.layer.borderColor = myColor.cgColor
        btn_Outlet.layer.borderColor = myColor.cgColor

        let tap = UITapGestureRecognizer(target: self, action:#selector(ViewController.tappedme ))
        img_Profile.addGestureRecognizer(tap)
        img_Profile.isUserInteractionEnabled = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @objc func tappedme(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum){
            imagepicker.delegate = self
            imagepicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            imagepicker.allowsEditing = true
            present(imagepicker, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "", message: "NO CAMERA", preferredStyle: .alert)
            self.present(alert,animated: true)
            let when = DispatchTime.now()+0.1
            DispatchQueue.main.asyncAfter(deadline: when){
                self.dismiss(animated: true)
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            
            img_Profile.image = pickedImage
            dismiss(animated: true)
            return image1 = pickedImage
            
        }
    }
    func EmailAlert()  {
        // Email ID Alert Function-----------
        if (txtFd_Email.text?.isValidEmail)!{
            key = 0
            let alert = UIAlertController(title: "Valid", message: "Email Id", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler:nil))
            present(alert, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Email", message: "Enter Valid Mail Id", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
    }
    
    func PasswordAlert()  {
        // Password Alert Function-----------
        if (txFd_Pwd.text?.isPasswordValid)!{
            let alert = UIAlertController(title: "Password", message: "iPhone strong password created.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler:nil))
            present(alert, animated: true)
        }
        else if txFd_Pwd.text == "" {
            let alert = UIAlertController(title: "Password", message: "Please Enter the Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler:nil))
            present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "Password", message: "iPhone created a strong password for this App. include some special character.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler:nil))
            present(alert, animated: true)
        }
    }
    
    @IBAction func txtFd_Action(_ sender: Any) {
        EmailAlert()
    }
    
    @IBAction func txtFd_PwdAc(_ sender: Any) {
//                PasswordAlert()
    }
    @IBAction func btn_Submit(_ sender: Any) {
        if  (txFd_Pwd.text?.isPasswordValid)! && (txtFd_Email.text?.isValidEmail)! {
            let alert = UIAlertController(title: "Login", message: "Successful", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{action in navi()}))
            present(alert, animated: true)
        }else  {
            let alert = UIAlertController(title: "Password", message: "Please Enter the Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler:nil))
            present(alert, animated: true)
        }
        func navi () {
            let svc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
}

extension String{
    
    var isPasswordValid : Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
    var isValidEmail: Bool{
        let emailReg = "[A-Z0-9a-z.%+-]+@[A-Za-z)0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: self)
    }
}

