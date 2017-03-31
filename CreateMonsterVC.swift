//
//  CreateMonsterVC.swift
//  Portfolio-02
//
//  Created by champ on 09/03/17.
//  Copyright © 2017 champ. All rights reserved.
//

import UIKit

class CreateMonsterVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var speciesTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!
    @IBOutlet weak var healthTextField: UITextField!
    @IBOutlet weak var displayFeedback: UILabel!
    var myMonster = Monster(name: "Unknown", age: 0, species: "Unknown", power: 0, health: 0)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBtnPressed(_ sender: Any) {
        var messageString:String = "Not all fields were filled in!"
        if nameTextField.text != ""  && ageTextField.text != "" && speciesTextField.text != "" && powerTextField.text != "" && healthTextField.text != ""
        {
            // do something if its not empty
            let constantName = nameTextField.text
            let constantAge = Int(ageTextField.text!)
            let constantSpecies = speciesTextField.text
            let constantPower = Int(powerTextField.text!)
            let constantHealth = Int(healthTextField.text!)
            if (constantAge != nil && constantPower != nil && constantHealth != nil){
                
                //Monster cannot be updated ,If the monster has not been created yet
                if (myMonster.age != 0){
                myMonster = Monster(name:constantName!, age:constantAge!, species:constantSpecies!, power:constantPower!, health:constantHealth!)
                    messageString = myMonster.sayUpdate()
                }
                else{
                    messageString = "Monster has not been initialized yet"
                }
               
            }
            else {
                messageString = "Please enter numbers"
            }
            
        }
        self.displayFeedback.text = messageString
        }

    


    @IBAction func saveBtnPressed(_ sender: Any) {
        var messageString:String = "Not all fields were filled in!"
        if nameTextField.text != ""  && ageTextField.text != "" && speciesTextField.text != "" && powerTextField.text != "" && healthTextField.text != ""
        {
            // do something if its not empty
            let constantName = nameTextField.text
            let constantAge = Int(ageTextField.text!)
            let constantSpecies = speciesTextField.text
            let constantPower = Int(powerTextField.text!)
            let constantHealth = Int(healthTextField.text!)
            if (constantAge != nil && constantPower != nil && constantHealth != nil){
                 myMonster = Monster(name:constantName!, age:constantAge!, species:constantSpecies!, power:constantPower!, health:constantHealth!)
                messageString = myMonster.saySave()
            }
            else {
                messageString = "Please enter numbers"
            }
            
        }
        self.displayFeedback.text = messageString
}

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


