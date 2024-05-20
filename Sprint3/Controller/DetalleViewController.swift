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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        lblTitulo.text = recibirTituloPelicula ?? ""
        lblActores.text = recibirActoresPelicula ?? ""
        lblFecha.text = recibirFechaPelicula ?? ""
        lblPremios.text = recibirPremioPelicula ?? ""
        
        guard let url = URL(string: recibirPortadaPelicula ?? "https://img.freepik.com/vector-premium/no-hay-foto-disponible-icono-vector-simbolo-imagen-predeterminado-imagen-proximamente-sitio-web-o-aplicacion-movil_87543-10615.jpg")else {return}
        imgPortada.kf.setImage(with: url)
        // Do any additional setup after loading the view.
    }


}
