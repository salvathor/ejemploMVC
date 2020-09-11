//
//  Articulo.swift
//  ejemploMVC
//
//  Created by Salvador Lopez on 10/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation

struct ArticuloLista: Decodable {
  let articles: [Articulo]
}

struct Articulo: Decodable {
  let title: String?
  let description: String?
}
