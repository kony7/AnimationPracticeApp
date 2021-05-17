//
//  ViewController.swift
//  count20210510
//
//  Created by 小西星七 on 2021/05/10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var firstLView: UIView!
    @IBOutlet var firstRView: UIView!
    @IBOutlet var secondLView: UIView!
    @IBOutlet var secondRView: UIView!
    @IBOutlet var thirdView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label2.alpha = 0
        
        firstLView.bounds.size.height = 0
        firstRView.bounds.size.height = 0
        secondLView.bounds.size.height = 0
        secondRView.bounds.size.height = 0
        thirdView.bounds.size.height = 0
    }
    
    @IBAction func pink(){
        firstRView.backgroundColor = UIColor.magenta
        firstLView.backgroundColor = UIColor.magenta
        secondLView.backgroundColor = UIColor.lightGray
        secondRView.backgroundColor = UIColor.lightGray
        thirdView.backgroundColor = UIColor.magenta
        playSound(name: "loven")
    }
    
    @IBAction func red(){
        firstRView.backgroundColor = UIColor.red
        firstLView.backgroundColor = UIColor.red
        secondLView.backgroundColor = UIColor.lightGray
        secondRView.backgroundColor = UIColor.lightGray
        thirdView.backgroundColor = UIColor.red
        playSound(name: "klaxon")
    }
    
    @IBAction func yellow(){
        firstRView.backgroundColor = UIColor.orange
        firstLView.backgroundColor = UIColor.orange
        secondLView.backgroundColor = UIColor.yellow
        secondRView.backgroundColor = UIColor.yellow
        thirdView.backgroundColor = UIColor.orange
        playSound(name: "gaogaonoegen")
    }
    
    @IBAction func brown(){
        firstRView.backgroundColor = UIColor.brown
        firstLView.backgroundColor = UIColor.brown
        secondLView.backgroundColor = UIColor.orange
        secondRView.backgroundColor = UIColor.orange
        thirdView.backgroundColor = UIColor.brown
        playSound(name: "heyguysyabana")
    }
    
    @IBAction func green(){
        firstRView.backgroundColor = UIColor.green
        firstLView.backgroundColor = UIColor.green
        secondLView.backgroundColor = UIColor.darkGray
        secondRView.backgroundColor = UIColor.darkGray
        thirdView.backgroundColor = UIColor.green
        playSound(name: "bachibachiyabana")
    }

    @IBAction func pushDONE(){
        number = number + 1
        label.text = String(number)
       
        
        if number == 3{
            
            playSound(name: "pika")
            
            UIView.transition(with: label, duration: 0.3, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .autoreverse, animations: {
                self.firstLView.center.y += 100.0
                self.firstLView.bounds.size.height += 400.0
                self.firstRView.center.y += 100.0
                self.firstRView.bounds.size.height += 400.0
            }) { _ in
                self.firstLView.center.y -= 100.0
                self.firstLView.bounds.size.height += 600.0
                self.firstRView.center.y -= 100.0
                self.firstRView.bounds.size.height += 600.0
            }

        }else if number == 7{
            
            UIView.transition(with: label, duration: 0.3, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .autoreverse, animations: {
                self.secondLView.center.y += 100.0
                self.secondLView.bounds.size.height += 400.0
                self.secondRView.center.y += 100.0
                self.secondRView.bounds.size.height += 400.0
            }) { _ in
                self.secondLView.center.y -= 100.0
                self.secondLView.bounds.size.height += 600.0
                self.secondRView.center.y -= 100.0
                self.secondRView.bounds.size.height += 600.0
            }

            playSound(name: "pika")
            
        }else if number == 10{
            
            UIView.transition(with: label, duration: 0.3, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .autoreverse, animations: {
                self.thirdView.center.y += 100.0
                self.thirdView.bounds.size.height += 400.0
            }) { _ in
                self.thirdView.center.y -= 100.0
                self.thirdView.bounds.size.height += 600.0
            }
            
            UIView.animate(withDuration: 1, delay: 0, options: [.transitionCrossDissolve], animations: {
                self.label.alpha = 0
                self.label2.alpha = 1
            }, completion: { (_) in
                self.label.alpha = 0
                self.label2.alpha = 1
            })
            
            UIView.transition(with: label2, duration: 1.0, options: [.transitionFlipFromBottom], animations: nil, completion: nil)
            
            number = -1
            playSound(name: "baaan")
        
        }else{
            playSound(name: "piki")
        }
        
        if number == 0{
            
            label.alpha = 1
            label2.alpha = 0
            firstLView.bounds.size.height = 0
            firstRView.bounds.size.height = 0
            secondLView.bounds.size.height = 0
            secondRView.bounds.size.height = 0
            thirdView.bounds.size.height = 0
        }
    }
    
   func playSound(name: String) {
            guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
                print("音源ファイルが見つかりません")
                return
            }

            do {
                // AVAudioPlayerのインスタンス化
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

                // 音声の再生
                audioPlayer.play()
            } catch {
            }
        }

}

