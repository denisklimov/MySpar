//
//  Data.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit


class DataOfModels {
    
    static var stories = [
        StoryModel(image: UIImage(named: "storyFirst")!, footer: "Вкусные хот-доги", isRead: true),
        StoryModel(image: UIImage(named: "storySecond")!, footer: "Яйца на завтрак", isRead: true),
        StoryModel(image: UIImage(named: "storyThird")!, footer: "Быстрый перекус", isRead: false),
        StoryModel(image: UIImage(named: "storyFourth")!, footer: "Орехи для здоровья", isRead: false),
        StoryModel(image: UIImage(named: "storyFifth")!, footer: "Любимые овощи", isRead: false),
        StoryModel(image: UIImage(named: "storySixth")!, footer: "Полезный обед", isRead: true),
    ]
    
    static var banners = [
        BannerModel(image: UIImage(named: "01specialOffer")!),
        BannerModel(image: UIImage(named: "02specialOffer")!),
        BannerModel(image: UIImage(named: "03specialOffer")!),
        BannerModel(image: UIImage(named: "04specialOffer")!),
        BannerModel(image: UIImage(named: "05specialOffer")!),
        BannerModel(image: UIImage(named: "06specialOffer")!),
        BannerModel(image: UIImage(named: "07specialOffer")!),
    ]
    
    static var bonus = [BonusModel(bounus: 1276)]
    
    static let services = [
        ServiceModel(title: "Абонемент на кофе", titleColor: .white, image: UIImage(named: "servicesCoffee")!),
        ServiceModel(title: "Винный клуб", titleColor: .white, image: UIImage(named: "servicesWine")!),
        ServiceModel(title: "Доставка", titleColor: .white, image: UIImage(named: "servicesDelivery")!),
        ServiceModel(title: "Скидки и акции", titleColor: .black, image: UIImage(named: "servicesDiscounts")!),
        ServiceModel(title: "Список покупок", titleColor: .white, image: UIImage(named: "servicesShoppingList")!),
        ServiceModel(title: "Карта покупателя", titleColor: .black, image: UIImage(named: "servicesCard")!),
    ]
    
    static let recomendations = [
        ProductModel(
            accentLabel: "Выгодно",
            accentLabelColor: UIColor(named: "AccentGreen"),
            productImage: UIImage(named: "lamber")!,
            actualPrice: 159.99,
            oldPrice: 199.99,
            discount: "20%"),
        
        ProductModel(
            accentLabel: "Наша кухня",
            accentLabelColor: UIColor.blue,
            productImage: UIImage(named: "pizza")!,
            actualPrice: 295.47,
            oldPrice: 355.99,
            discount: "17%"),
        
        ProductModel(
            accentLabel: nil,
            accentLabelColor: UIColor.black,
            productImage: UIImage(named: "iceCream")!,
            actualPrice: 226.99,
            oldPrice: nil,
            discount: nil),
        
        ProductModel(
            accentLabel: "Отличная цена",
            accentLabelColor: nil,
            productImage: UIImage(named: "watermelon")!,
            actualPrice: 29.99,
            oldPrice: nil,
            discount: nil),
    ]
    
    
    static let sweets = [
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            productImage: UIImage(named: "sweets01")!,
            actualPrice: 1.90,
            oldPrice: nil,
            discount: "10%"),
        
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            productImage: UIImage(named: "sweets02")!,
            actualPrice: 2.90,
            oldPrice: nil,
            discount: "20%"),
        
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            productImage: UIImage(named: "sweets03")!,
            actualPrice: 3.90,
            oldPrice: nil,
            discount: "30%"),
        
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .magenta,
            productImage: UIImage(named: "sweets04")!,
            actualPrice: 40.90,
            oldPrice: 400.90,
            discount: "40%"),
        
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            productImage: UIImage(named: "sweets05")!,
            actualPrice: 5.90,
            oldPrice: 12.0,
            discount: "50%"),
        
        ProductModel(
            accentLabel: "Конфеты",
            accentLabelColor: .systemTeal,
            productImage: UIImage(named: "sweets06")!,
            actualPrice: 6.90,
            oldPrice: nil,
            discount: nil),
        
        ProductModel(
            accentLabel: "Конфеты",
            accentLabelColor: .systemTeal,
            productImage: UIImage(named: "sweets07")!,
            actualPrice: 7.90,
            oldPrice: nil,
            discount: nil)
        ]
}
