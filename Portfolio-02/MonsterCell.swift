//
//  MonsterCell.swift
//  Portfolio-02
//
//  Created by champ on 18/03/17.
//  Copyright © 2017 champ. All rights reserved.
//

import UIKit

class MonsterCell: UITableViewCell {

    @IBOutlet weak var MonsterNameLbl: UILabel!
    @IBOutlet weak var MonsterSpeciesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateUI(monsterElement: Monster){
        MonsterNameLbl.text = monsterElement.name
        MonsterSpeciesLbl.text = monsterElement.species
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
