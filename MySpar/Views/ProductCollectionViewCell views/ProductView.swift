//
//  ProductView.swift
//  MySpar
//
//  Created by Denis Klimov on 15.08.2023.
//

import UIKit

class ProductView: UIView {

    private var productModel: ProductModel
    
    private var productImageView: UIImageView!
    private var actualPriceLabel: UILabel!
    private var buyButton: UIButton!
    private var accentLabelView: AccentLabelView?
    private var discountLabelView: DiscountLabelView?
    private var oldPriceLabel: UILabel?
    
    private func initRequiredSubviews() {
        
        productImageView = UIImageView(frame: .zero)
        addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        buyButton = UIButton(frame: .zero)
        buyButton.setImage(UIImage(systemName: "cart"), for: .normal)
        buyButton.backgroundColor = UIColor(named: "AccentGreen")
        buyButton.tintColor = .white
        buyButton.setPreferredSymbolConfiguration(.init(scale: .small), forImageIn: .normal)
        buyButton.layer.cornerRadius = 15.0
        buyButton.clipsToBounds = true
        addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 5.0).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        let heightAnchorBuyButton = buyButton.heightAnchor.constraint(equalTo: buyButton.widthAnchor, multiplier: 1.0)
        heightAnchorBuyButton.priority = .init(rawValue: 999)
        heightAnchorBuyButton.isActive = true
        
        actualPriceLabel = UILabel(frame: .zero)
        actualPriceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        addSubview(actualPriceLabel)
        actualPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        actualPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        actualPriceLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -5).isActive = true
        let centerYAnchorActualPriceLabel = actualPriceLabel.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor)
        centerYAnchorActualPriceLabel.priority = .init(rawValue: 500)
        centerYAnchorActualPriceLabel.isActive = true
        

        update(by: productModel)
        
    }
    
    private func initOptionalAccentLabel() {
        
        accentLabelView = AccentLabelView(frame: .zero)
        guard let accentLabelView = accentLabelView else { return }
        
        addSubview(accentLabelView)
        accentLabelView.translatesAutoresizingMaskIntoConstraints = false
        accentLabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        accentLabelView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    
    private func initOptionalDiscountLabel() {
        
        discountLabelView = DiscountLabelView(frame: .zero)
        guard let discountLabelView = discountLabelView else { return }
        addSubview(discountLabelView)
        discountLabelView.translatesAutoresizingMaskIntoConstraints = false
        discountLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0).isActive = true
        discountLabelView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor).isActive = true
    }
    
    private func initOptionalOldPriceLabel() {
        
        oldPriceLabel = UILabel(frame: .zero)
        guard let oldPriceLabel = oldPriceLabel else { return }
        
        oldPriceLabel.isHidden = true
        oldPriceLabel.textColor = UIColor.systemGray2
        oldPriceLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        addSubview(oldPriceLabel)
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.leadingAnchor.constraint(equalTo: actualPriceLabel.leadingAnchor).isActive = true
        oldPriceLabel.topAnchor.constraint(equalTo: actualPriceLabel.bottomAnchor, constant: 2).isActive = true
        oldPriceLabel.trailingAnchor.constraint(equalTo: actualPriceLabel.trailingAnchor).isActive = true
        oldPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    

    
    func update(by productModel: ProductModel) {
        
        productImageView.image = productModel.productImage
        actualPriceLabel.text = "\(productModel.actualPrice) ₽/шт"
        
        if let productAccentLabel = productModel.accentLabel {
            
            if accentLabelView == nil {
                initOptionalAccentLabel()
            }
            self.accentLabelView?.label = productAccentLabel
            self.accentLabelView?.background = productModel.accentLabelColor
            
        } else {
            guard let accentLabelView = accentLabelView else { return }
            accentLabelView.removeFromSuperview()
            self.accentLabelView = nil
        }
        
        if let productOldPrice = productModel.oldPrice {

            let attributedString = NSAttributedString(string: String(describing: productOldPrice.description),
                                                      attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            if oldPriceLabel == nil {
                initOptionalOldPriceLabel()
            }
            self.oldPriceLabel?.attributedText = attributedString
            
        } else {
            guard let oldPriceLabel = oldPriceLabel else { return }
            self.oldPriceLabel?.removeFromSuperview()
            self.oldPriceLabel = nil
        }
        
        
        
        if let productDiscount = productModel.discount {
            if let _ = discountLabelView {
                discountLabelView?.isHidden = false
                discountLabelView!.discount = productDiscount
            } else {
                initOptionalDiscountLabel()
                discountLabelView!.discount = productDiscount
            }
            
        } else {
            guard let _ = discountLabelView else { return }
            discountLabelView?.isHidden = true
        }
    }
    
    required init(productModel: ProductModel) {
        self.productModel = productModel
        super.init(frame: .zero)
        initRequiredSubviews()
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}














//
//
//var productModel: ProductModel? {
//    didSet {
//        guard let _ = productModel else { return }
//        prepareSubviews()
//        addSubviewsAndConstraints()
//    }
//}
//
//private var imageView = UIImageView()
//private var buyButton = UIButton()
//private var actualPriceLabel = UILabel()
//private var accentLabelView: AccentLabelView?
//private var oldPriceLabel: UILabel?
//private var discountLabelView: DiscountLabelView?
//
//
//private func prepareSubviews() {
//
//    imageView.image = productModel?.productImage
//
//    buyButton.setImage(UIImage(named: "cart"), for: .normal)
//    buyButton.backgroundColor = UIColor(named: "AccentGreen")
//    buyButton.tintColor = .white
//    buyButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(scale: .small), forImageIn: .normal)
//    actualPriceLabel.text = String(describing: productModel?.actualPrice)
//
//    if let productAccentLabel = productModel?.accentLabel {
//        var accentLabelBackgroundColor = UIColor.red.withAlphaComponent(0.3)
//        if let accentLabelColor = productModel?.accentLabelColor {
//            accentLabelBackgroundColor = accentLabelColor.withAlphaComponent(0.3)
//        }
//        accentLabelView = AccentLabelView(label: productAccentLabel, background: accentLabelBackgroundColor)
//    } else {
//        accentLabelView = nil
//    }
//
//    if let productOldPrice = productModel?.oldPrice {
//        oldPriceLabel = UILabel()
//        oldPriceLabel?.text = productOldPrice.description
//        oldPriceLabel?.textColor = UIColor.systemGray2
//        oldPriceLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
//    } else {
//        oldPriceLabel = nil
//    }
//
//    if let productDiscount = productModel?.discount {
//        discountLabelView = DiscountLabelView(discount: productDiscount)
//    } else {
//        discountLabelView = nil
//    }
//
//
//}
//
//private func addSubviewsAndConstraints() {
//    addSubview(imageView)
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//    imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
//
//    addSubview(buyButton)
//    addSubview(actualPriceLabel)
//
//    if let accentLabelView = accentLabelView {
//        addSubview(accentLabelView)
//    }
//
//    if let oldPriceLabel = oldPriceLabel {
//        addSubview(oldPriceLabel)
//    }
//
//    if let discountLabelView = discountLabelView {
//        addSubview(discountLabelView)
//    }
//
//}
//
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
