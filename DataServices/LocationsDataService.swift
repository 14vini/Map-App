//
//  LocationsDataService.swift
//  Map App
//
//  Created by Vinicius on 5/26/25.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Maria Marquinhos",
            country: "Brasil",
            cityName: "Garça",
            coordinates: CLLocationCoordinate2D(latitude: -22.211380002230158, longitude:  -49.66039501159805),
            description: "A Loja Maria Marquinhos Confeitaria, Café & Pães, está localizada em R. Dep. Manoel Joaquim Fernandes, 678-774 - Jardim Paulista, Garça - SP, 17400-088, Brasil. O local funciona aos domingos e segundas. O telefone para contato é +55 14 99639-2193. A loja tem uma boa avaliação",
            imageNames: [
                "maria marquinhos 1",
                "maria marquinhos 2",
                "maria marquinhos 3",
                "maria marquinhos 4"
            ],
            link: "https://www.instagram.com/_mariamarquinhosconfeitaria/"),
        Location(
            name: "Fulltime",
            country: "Brasil",
            cityName: "Garça",
            coordinates: CLLocationCoordinate2D(latitude: -22.215248133944, longitude:  -49.65385611771095),
            description: "A Fulltime é uma multinacional fundada há 15 anos. Com presença em todo o território latino americano, conta com unidades na Argentina, México e Estados Unidos. A sede brasileira está situada no município de Garça – São Paulo, cidade pólo nacional da segurança eletrônica.",
            imageNames: [
                "fulltime 1",
                "fulltime 2",
                "fulltime 3"
            ],
            link: "https://fulltime.com.br"),
        Location(
            name: "Museu de Paleontologia",
            country: "Brasil",
            cityName: "Marília",
            coordinates: CLLocationCoordinate2D(latitude: -22.22040264617813, longitude:  -49.94834964839387),
            description: "O Museu de Paleontologia de Marília é um museu de ciências localizado em Marília, São Paulo, Brasil. É um dos poucos museus dedicados exclusivamente à paleontologia no país.[1] A instituição foi criada em 25 de novembro de 2004, por conta das escavações realizadas pelo paleontólogo William Nava que desde 1993 coleta fósseis de dinossauros e outros animais pré-históricos na região de Marília e outras localidades do oeste do estado de S. Paulo.",
            imageNames: [
                "museu marilia 1",
                "museu marilia 2",
                "museu marilia 3"
            ],
            link: "https://pt.wikipedia.org/wiki/Museu_de_Paleontologia_de_Marília")

    ]
    
}
