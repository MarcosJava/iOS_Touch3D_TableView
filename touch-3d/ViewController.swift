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
        
        if traitCollection.forceTouchCapability == .Available {
            registerForPreviewingWithDelegate(self, sourceView: tableView)
        }
        
    }
    
    func carregaTableView() {
        pessoas.append(Pessoa(nome: "Marcos", idade: 24))
        pessoas.append(Pessoa(nome: "Joao", idade: 15))
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        
        let pessoa = pessoas[indexPath.row]
        cell.textLabel?.text = pessoa.nome
        
        return cell;
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pessoas.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
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
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRowAtPoint(location),
            cell = tableView.cellForRowAtIndexPath(indexPath) else {
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
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController){
        print("veio")
        
        if let navigation = navigationController {
            navigation.showViewController(viewControllerToCommit, sender: nil)
        }
        
    }

}

