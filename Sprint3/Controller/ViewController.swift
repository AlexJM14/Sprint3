//
//  ViewController.swift
//  Sprint3
//
//  Created by Alex Jumbo on 19/5/24.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var btnBuscar: UIButton!
    @IBOutlet weak var txtFldBuscador: UITextField!
    var titulo="Sin resultados"
    var fechaLanzamiento=""
    var actores=""
    var premios=""
    var portada=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func buscar(){
        if !txtFldBuscador.text!.isEmpty{
            AF.request("http://www.omdbapi.com/?apikey=99cc4d2d&t=\(txtFldBuscador.text ?? "")").responseDecodable(of:PeliculaModel.self) {
                (respuesta) in
                self.titulo=respuesta.value?.title ?? "Sin resultados"
                self.fechaLanzamiento=respuesta.value?.released ?? ""
                self.actores=respuesta.value?.actors ?? ""
                self.premios=respuesta.value?.awards ?? ""
                self.portada=respuesta.value?.poster ?? ""
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "buscar"{
            let pelicula = segue.destination as! DetalleViewController
            pelicula.recibirTituloPelicula = titulo
            pelicula.recibirFechaPelicula = fechaLanzamiento
            pelicula.recibirPremioPelicula = premios
            pelicula.recibirActoresPelicula = actores
            pelicula.recibirPortadaPelicula = portada
        }
    }
    
    @IBAction func btnBuscarPeli(_ sender: Any) {
        if !txtFldBuscador.text!.isEmpty{
            performSegue(withIdentifier: "buscar", sender: self)}
        buscar()
    }
    
}

