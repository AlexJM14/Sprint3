//
//  DetalleViewController.swift
//  Sprint3
//
//  Created by Alex Jumbo on 20/5/24.
//

import UIKit
import Kingfisher
class DetalleViewController: UIViewController {
    @IBOutlet weak var lblActores: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblPremios: UILabel!
    @IBOutlet weak var imgPortada: UIImageView!
    
    var recibirTituloPelicula:String?
    var recibirFechaPelicula:String?
    var recibirPremioPelicula:String?
    var recibirActoresPelicula:String?
    var recibirPortadaPelicula:String?
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
            self.lblTitulo.text = self.recibirTituloPelicula ?? ""
            self.lblActores.text = self.recibirActoresPelicula ?? ""
            self.lblFecha.text = self.recibirFechaPelicula ?? ""
            self.lblPremios.text = self.recibirPremioPelicula ?? ""
            
            guard let url = URL(string: self.recibirPortadaPelicula ?? "https://img.freepik.com/vector-premium/no-hay-foto-disponible-icono-vector-simbolo-imagen-predeterminado-imagen-proximamente-sitio-web-o-aplicacion-movil_87543-10615.jpg")else {return}
            self.imgPortada.kf.setImage(with: url)
        }
    }


}
