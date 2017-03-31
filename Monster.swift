//
//  Monster.swift
//  Portfolio-02
//
//  Created by champ on 09/03/17.
//  Copyright © 2017 champ. All rights reserved.
//

import UIKit

class Monster: NSObject {
    private var _name:String?
    private var _age:Int?
    private var _species:String?
    private var _power:Int?
    private var _health:Int?
    
    var name:String{
        return _name!
    }
    
    var age:Int{
        return _age!
    }
    
    var species:String{
        return _species!
    }
    
    var power:Int{
        return _power!
    }
    
    var health:Int{
        return _health!
    }
    
    
     init(name:String, age:Int, species:String, power:Int, health:Int){
        _name = name
        _age = age
        _species = species
        _power = power
        _health = health
    }
    
    //    var gsName:String? {
    //        get{
    //            return name;
    //        }
    //        set{
    //            name = newValue;
    //        }
    //    }
    //
    
    
    
    func sayUpdate()->String{
        return "Old Monster updated.Hello \(name).You are \(age) years old.You are from the specie \(species).Power is \(power) and health is \(health)"
    }
    
    func saySave()->String{
        return "New Monster created. Hello \(name). You are \(age) years old. You are from the specie \(species). Power is \(power) and health is \(health)"
    }
    


}
