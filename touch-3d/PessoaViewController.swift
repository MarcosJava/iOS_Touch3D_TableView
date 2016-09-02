//
//  PessoaViewController.swift
//  touch-3d
//
//  Created by Marcos Felipe Souza on 31/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class PessoaViewController: UIViewController {
    
    @IBOutlet weak var nomeLabel: UILabel!

    @IBOutlet weak var idadeLabel: UILabel!
    
    var pessoa:Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nomeLabel.text = pessoa?.nome
        idadeLabel.text = pessoa?.idade.description
    }
    
    init(pessoa: Pessoa) {
        self.pessoa = pessoa
        super.init(nibName: "PessoaViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
