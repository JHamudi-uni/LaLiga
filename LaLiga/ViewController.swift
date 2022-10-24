//
//  ViewController.swift
//  LaLiga
//
//  Created by muhamed jaber on 20.10.22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var punkteStand: UILabel!
    var punkte = 3
    var nullPunkte = false
    
    
    let date = Date.now.addingTimeInterval(5)
    
   
    
   
//     Prints "Sep 9, 2014, 4:30 AM"
    let futureDate: Date = {
           var future = DateComponents(
               year: 2022,
               month: 10,
               day: 25,
               hour: 0,
               minute: 0,
               second: 0
           )
           return Calendar.current.date(from: future)!
       }()

       var countdown: DateComponents {

           return Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
       }

       @objc func updateTime() {
           let countdown = self.countdown //only compute once per call
           let days = countdown.day!
           let hours = countdown.hour!
           let minutes = countdown.minute!
           let seconds = countdown.second!
           dateLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
       }

       func runCountdown() {
           Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
       }
    
   
    
    @IBAction func addPoints(_ sender: UIButton) {
//        if (punkte == 0){
//            decreasePoints()
//        }
        punkte += 1
        print(punkte)
//        decreasePoints()
//        viewDidLoad()
        
    }
    
    
    
    @objc func decreasePoints(){
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
//                 Put your code which should be executed with a delay here
        if(self.punkte > 0){
                    self.punkte -= 1
                    
                    print(self.punkte)
                    self.viewDidAppear(true)
                    
                     }
            }
    }
    

   
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        decreasePoints()
        
    }
    
 
    
  
    
    
    
    override func viewDidLoad() {

        
       updateTime()
        
   /* Liefert einfach nur uhrzeit:
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    */

        if (punkte < 0){
           nullPunkte = true
        }else {
            nullPunkte = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.viewDidLoad()
        }
        
        punkteStand.text = "Punkte: \(punkte)"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

