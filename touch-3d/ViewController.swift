//
//  ViewController.swift
//  touch-3d
//
//  Created by Marcos Felipe Souza on 31/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var pessoas = Array<Pessoa>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregaTableView()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: tableView)
        }
        
    }
    
    func carregaTableView() {
        pessoas.append(Pessoa(nome: "Marcos", idade: 25))
        pessoas.append(Pessoa(nome: "Joao", idade: 15))
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let pessoa = pessoas[indexPath.row]
        cell.textLabel?.text = pessoa.nome
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pessoas.count
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let pessoa = pessoas[indexPath.row]
        print("chegou: \(pessoa.nome)")
        
        let pessoaView = PessoaViewController(pessoa: pessoa)
        if let navigation = navigationController {
            navigation.pushViewController(pessoaView, animated: true)
        }
    }
}


extension ViewController :UIViewControllerPreviewingDelegate {
    
    //peek
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRow(at: viewControllerForLocation),
           let cell = tableView.cellForRow(at: indexPath) else {
                return nil
        }
    
        let pessoa = self.pessoas[indexPath.row]
        print(" nome: \(pessoa.nome) e idade \(pessoa.idade)")
        let pessoaView = PessoaViewController(pessoa: pessoa)
    
        pessoaView.preferredContentSize = CGSize(width: 0, height: 0)
        previewingContext.sourceRect = cell.frame
        return pessoaView
    }
    
    //pop
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController){
        print("veio")
        
        if let navigation = navigationController {
            navigation.show(viewControllerToCommit, sender: nil)
        }
        
    }

}

