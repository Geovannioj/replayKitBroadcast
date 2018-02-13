//
//  ViewController.swift
//  broadCastReplayKit
//
//  Created by Geovanni Oliveira de Jesus on 08/02/2018.
//  Copyright © 2018 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController, RPBroadcastActivityViewControllerDelegate {


  @IBOutlet weak var stopBroadcast: UIButton!
  @IBOutlet weak var statusLbl: UILabel!
  @IBOutlet weak var startBroadcast: UIButton!
  @IBOutlet weak var BntToBeChanged: UIButton!
  @IBOutlet weak var changeColor2: UIButton!
  @IBOutlet weak var changeColor1: UIButton!
  
  var mainBroadcastController = RPBroadcastController()
  var controller = RPBroadcastController()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func didPressStartBroadcast() {
    RPBroadcastActivityViewController.load { (broadcastAVC, error) in
      
      if let broadcastAVC = broadcastAVC {
          broadcastAVC.delegate = self
        
          self.present(broadcastAVC, animated: true, completion: nil)
        
      }
    }
  }
  
  func didFinishBroadcast() {
    self.mainBroadcastController.finishBroadcast { error in
      
      if error == nil {
        self.updateBroadcastBtn()
      }
    }
  }
  func broadcastActivityViewController(_ broadcastActivityViewController: RPBroadcastActivityViewController, didFinishWith broadcastController: RPBroadcastController?, error: Error?) {
    
    broadcastActivityViewController.dismiss(animated: true) {
      
      self.mainBroadcastController.startBroadcast(handler: { (error) in
          //broadcast
        
      })
    }
    
  }
  
  func updateBroadcastBtn() {
    if mainBroadcastController.isBroadcasting == true {
      
      self.startBroadcast.setTitle("Parar Transmissão", for: .normal)
      self.startBroadcast.tintColor = UIColor.red
      
    } else {
      self.startBroadcast.setTitle("Iniciar Transmissão", for: .normal)
      self.startBroadcast.tintColor = UIColor.blue
    }
  }
  
  @IBAction func changeToColor1(_ sender: Any) {
      self.BntToBeChanged.backgroundColor = UIColor.blue
  }
  @IBAction func changeToColor2(_ sender: Any) {
    
    self.BntToBeChanged.backgroundColor = UIColor.brown
  }
  @IBAction func startBroadcastAction(_ sender: Any) {
    didPressStartBroadcast()
    updateBroadcastBtn()
  }
  @IBAction func stopBroadcastAction(_ sender: Any) {
      didFinishBroadcast()
  }
  
}

