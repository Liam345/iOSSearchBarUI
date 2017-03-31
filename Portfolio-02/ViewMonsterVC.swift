//
//  ViewMonsterVC.swift
//  Portfolio-02
//
//  Created by champ on 09/03/17.
//  Copyright © 2017 champ. All rights reserved.
//

import UIKit

class ViewMonsterVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var powerLbl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    private var _monster:Monster!
    
    var monster: Monster{
        get{
            return _monster
        }
        set{
            _monster = newValue
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = monster.name
        ageLbl.text = String(describing: monster.age)
        speciesLbl.text = monster.species
        powerLbl.text = String(describing: monster.power)
        healthLbl.text = String(describing: monster.health)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
