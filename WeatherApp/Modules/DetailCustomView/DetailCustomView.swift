//
//  DetailCustomView.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation
import UIKit

struct CustomViewData {
   var firstValue: String
   var secondvalue: String
   var icon:String
}

class DetailCustomView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var lblTypeDescription: UILabel!
    @IBOutlet weak var lblTypeValue: UILabel!
  

    @IBInspectable var isRounded: Bool  = false {
        didSet {
            if isRounded {
                self.setupeRoundStyleView()
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
   
    func loadNib() {
        // standard initialization logic
        Bundle.main.loadNibNamed("DetailCustomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
     func setupeRoundStyleView() {
        contentView.layer.cornerRadius = 10.0
        
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4.0
    }
    
    
    func initData(data: CustomViewData) {
        self.lblTypeDescription.text = data.firstValue
        self.lblTypeValue.text = data.secondvalue
        let image = UIImage(named: data.icon)
        self.iconImg.image = image
    }
    
    
    func getImage(weatherIconCode: String) {
        let iconUrlString = "https://openweathermap.org/img/w/\(weatherIconCode).png"

        if let iconUrl = URL(string: iconUrlString) {
            URLSession.shared.dataTask(with: iconUrl) { data, _, error in
                if let error = error {
                    return
                }
                guard let data = data else {
                    return
                }

                if let iconImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.iconImg.image = iconImage
                    }
                } else {
                    print("Error para crear imagen")
                }
            }.resume()
        } else {
            print("URL invalida")
        }
        
    }
}
