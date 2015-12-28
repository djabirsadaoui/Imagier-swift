//
//  Image.swift
//  imagier
//
//  Created by m2sar on 22/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import Foundation
class Image {

    var images:[(title:String,chemin:String,zoom:Float)] = [
        ("Machu Pichu","photo-01.jpg",10),
        ("Oxford","photo-02.jpg",10),
        ("Dresde","photo-03.jpg",15),
        ("Chichen Itza","photo-04.jpg",18),
        ("Kioto","photo-05.jpg",20),
        ("Gizeh","photo-06.jpg",25),
        ("près d'Edimbourg","photo-07.jpg",15),
        ("Cordoue","photo-08.jpg",20),
        ("Seville","photo-09.jpg",30),
        ("Grenade","photo-10.jpg",20),
        ("Venise","photo-11.jpg",22),
        ("Venise","photo-12.jpg",20),
        ("Venise","photo-13.jpg",20),
        ("Paris","photo-14.jpg",20),
        ("Paris","photo-15.jpg",20),
        ("Tiddis","photo-16.jpg",20),
        ("Wahsington state","photo-17.jpg",20),
        ("NGC 6302","photo-18.jpg",20),
        ("New York","photo-19.jpg",20),
        ("La Terre","photo-20.jpg",20),
    ]

    var compter = 0

    func getNextImage()->(String,String,Float){
        if(compter >= (images.count - 1)){
            compter = -1
        }
        compter++
        return images[compter]
    }
    
    
    func getPrecImage()->(String,String,Float){
        if(compter <= 0 ){
            compter = images.count
        }
        compter--
        return images[compter]
    }







}