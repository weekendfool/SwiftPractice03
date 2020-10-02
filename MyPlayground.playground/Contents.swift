import UIKit

class Product {
    var name:String // 商品名
    var price:Int // 商品の値段
    // 商品にかかる税金
    var consumptionTax:Int {
        get {
            // 商品の値段から消費税を計算
            print("Done Get")
            return Int(Float(price) * 0.1) // 税率10％
            
        }
        set {
            // 消費税から値段を計算
            price = Int(Float(newValue) / 0.1)
            print("Done Set")
        }
    }
        //商品名と商品の値段を初期化
        init(name: String, price: Int) {
            self.name = name
            self.price = price
        }
    }

// 100円のリンゴインスタンスを生成
var apple = Product(name: "リンゴ", price: 100)

// 100円のリンゴの消費税
apple.consumptionTax

apple.price = 200 //値段を変更
apple.consumptionTax


apple.consumptionTax = 30 // 税金を変更
apple.price
