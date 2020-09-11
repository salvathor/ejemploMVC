//
//  ViewController.swift
//  ejemploMVC
//
//  Created by Salvador Lopez on 10/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var articulos = [Articulo]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 150
    loadData(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd")!)
  }
  
  func loadData(url: URL){
    //Llamada a un ws
    URLSession.shared.dataTask(with: url) { (data, resp, error) in
      if let error = error{
        print("Error: \(error)")
      }else if let data = data {
        //print(String(data:data, encoding:.utf8))
        do {
          let articleList = try JSONDecoder().decode(ArticuloLista.self, from: data)
          //print(articleList)
          self.articulos = articleList.articles
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
          //print(self.articulos)
        }catch{
          print("Error: \(error)")
        }
      }
    }.resume()
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articulos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    cell.titulo.text = articulos[indexPath.row].title
    cell.content.text = articulos[indexPath.row].description
    return cell
  }
  
  
}
