//
//  ProductCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var productModel: ProductModel? {
        didSet {
            guard let productModel = productModel else { return }
            initProductView(width: productModel)
        }
    }
    
    private var productView: ProductView?
    
    private func initProductView(width productModel: ProductModel) {
        
        if let productView = productView {
            productView.update(by: productModel)
        } else {
            productView = ProductView(productModel: productModel)
            productView?.update(by: productModel)
            contentView.addSubview(productView!)
            productView?.translatesAutoresizingMaskIntoConstraints = false
            productView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
            productView?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            productView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
            productView?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        }
        
//        if let productView = productView {
//            productView.update(by: productModel)
//        } else {
//            productView = ProductView(productModel: productModel)
//            productView?.update(by: productModel)
//            contentView.addSubview(productView!)
//            productView?.translatesAutoresizingMaskIntoConstraints = false
//            productView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
//            productView?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
//            productView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
//            productView?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
//        }
    }
    
//
////    private var accentLabel: UILabel?
////    private var accentLabelBackgroundView: UIView?
//    private var accentLabelView: AccentLabelView?
//    private var discount: UILabel?
//    private var productImageView = UIImageView(frame: .zero)
//    private var currentPrice = UILabel(frame: .zero)
//    private var oldPrice: UILabel?
//
//    private let buyButton = UIButton(frame: .zero)
//
//    private func accentLabelCreateIfNeededAndUpdate() {
//        if let accentLabelView = accentLabelView {
//            if let productAccentLabel = product?.accentLabel {
//                accentLabelView.label = productAccentLabel
//            }
//
//        } else {
//            addAccentLabelSubview()
//        }
//    }
//
//    private var accentLabelUpdateData() {
//
//    }
//
//    private func updateProductData() {
//
//        productImageView.image = product.productImage
//        currentPrice.text = "\(product.currentPrice) ₽/шт"
//
//        if let productAccentLabel = product.accentLabel {
//            if let accentLabelUnwrapped = accentLabel {
//                accentLabelUnwrapped.text = productAccentLabel
//                if let accentLabelBackgroundViewUnwrapped = accentLabelBackgroundView {
//
//                }
//                accentLabelBackgroundView?.backgroundColor = product.accentLabelColor?.withAlphaComponent(0.3)
//            } else {
//                addAccentLabelSubview()
//                accentLabel?.text = product.accentLabel
//                accentLabelBackgroundView?.backgroundColor = product.accentLabelColor?.withAlphaComponent(0.3)
//            }
//        } else {
//            if let accentLabelUnwrapped = accentLabel {
//                accentLabelBackgroundView?.removeFromSuperview()
//            }
//        }
//
//        if product.accentLabel != nil && accentLabel == nil {
//            addAccentLabelSubview()
//        }
//
//
//
//        if product.oldPrice != nil && oldPrice == nil {
//            addOldPriceSubview()
//        }
//        if let oldPriceUnwarped = product.oldPrice {
//            let attributedString = NSAttributedString(string: String(describing: oldPriceUnwarped), attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
//            oldPrice?.attributedText = attributedString
//        }
//
//
//        if product.discount != nil && discount == nil {
//            addDiscountSubview()
//        }
//        discount?.text = product.discount
//    }
    
    private func decorateCell() {
        
        backgroundColor = .clear
        layer.shadowRadius = 5.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        
        contentView.layer.cornerRadius = 15.0
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        decorateCell()
        
        
        print("override init(frame: CGRect)")
        print(productModel)
        print("------------------------")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func addProductImageSubview() {
//
//        productImageView.image = UIImage()
//        productImageView.contentMode = .scaleAspectFill
//        contentView.addSubview(productImageView)
//
//        productImageView.translatesAutoresizingMaskIntoConstraints = false
//        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//        productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor).isActive = true
//
//    }
//
//    private func addBuyButtonSubview() {
//
//        buyButton.setImage(UIImage(systemName: "cart"), for: .normal)
//        buyButton.backgroundColor = UIColor(named: "AccentGreen")
//        buyButton.tintColor = .white
//        buyButton.layer.cornerRadius = 15
//        buyButton.clipsToBounds = true
//
//        let buyButtonImageConfiguration = UIImage.SymbolConfiguration(scale: .small)
//        buyButton.setPreferredSymbolConfiguration(buyButtonImageConfiguration, forImageIn: .normal)
//        contentView.addSubview(buyButton)
//
//        buyButton.translatesAutoresizingMaskIntoConstraints = false
//        buyButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 5.0).isActive = true
//        buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0).isActive = true
//        buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0).isActive = true
//        buyButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
//        buyButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
//
//    }
//
//    private func addCurrentPriceSubview() {
//
//        currentPrice.text = "0.0"
//        currentPrice.font = UIFont.systemFont(ofSize: 12, weight: .bold)
//        contentView.addSubview(currentPrice)
//
//        currentPrice.translatesAutoresizingMaskIntoConstraints = false
//        currentPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
//        currentPrice.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -5.0).isActive = true
//        let centerY = currentPrice.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor, constant: 0.0)
//        centerY.priority = .defaultLow
//        centerY.isActive = true
//
//    }
//
//    private func addOldPriceSubview() {
//
//        oldPrice = UILabel()
//        oldPrice?.textColor = UIColor.systemGray2
//        oldPrice?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
//        contentView.addSubview(oldPrice!)
//
//        oldPrice?.translatesAutoresizingMaskIntoConstraints = false
//        oldPrice?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//        oldPrice?.topAnchor.constraint(equalTo: currentPrice.bottomAnchor, constant: 2).isActive = true
//        oldPrice?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
//
//    }
//
//    private func addAccentLabelSubview() {
//
//        accentLabelBackgroundView = UIView()
//        accentLabelBackgroundView?.layer.cornerRadius = 10
//        accentLabelBackgroundView?.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
//        contentView.addSubview(accentLabelBackgroundView!)
//
//        accentLabelBackgroundView?.translatesAutoresizingMaskIntoConstraints = false
//        accentLabelBackgroundView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
//        accentLabelBackgroundView?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
//
//
//        accentLabel = UILabel()
//        accentLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
//        accentLabelBackgroundView?.addSubview(accentLabel!)
//
//        accentLabel?.translatesAutoresizingMaskIntoConstraints = false
//        accentLabel?.leadingAnchor.constraint(equalTo: accentLabelBackgroundView!.leadingAnchor, constant: 10).isActive = true
//        accentLabel?.topAnchor.constraint(equalTo: accentLabelBackgroundView!.topAnchor, constant: 3.0).isActive = true
//        accentLabel?.trailingAnchor.constraint(equalTo: accentLabelBackgroundView!.trailingAnchor, constant: -10).isActive = true
//        accentLabel?.bottomAnchor.constraint(equalTo: accentLabelBackgroundView!.bottomAnchor, constant: -3).isActive = true
//    }
//
//    private func addDiscountSubview() {
//
//        let discountBackgrounfView = UIView()
//        discountBackgrounfView.backgroundColor = .white.withAlphaComponent(0.7)
//        discountBackgrounfView.layer.cornerRadius = 10
//        discountBackgrounfView.clipsToBounds = true
//        contentView.addSubview(discountBackgrounfView)
//
//        discountBackgrounfView.translatesAutoresizingMaskIntoConstraints = false
//        discountBackgrounfView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0).isActive = true
//        discountBackgrounfView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 0.0).isActive = true
//
//        discount = UILabel()
//        discount?.textColor = .red
//        discount?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
//        discountBackgrounfView.addSubview(discount!)
//
//        discount?.translatesAutoresizingMaskIntoConstraints = false
//        discount?.leadingAnchor.constraint(equalTo: discountBackgrounfView.leadingAnchor, constant: 5.0).isActive = true
//        discount?.topAnchor.constraint(equalTo: discountBackgrounfView.topAnchor, constant: 2.0).isActive = true
//        discount?.trailingAnchor.constraint(equalTo: discountBackgrounfView.trailingAnchor, constant: -5.0).isActive = true
//        discount?.bottomAnchor.constraint(equalTo: discountBackgrounfView.bottomAnchor, constant: -2.0).isActive = true
//
//        print(discountBackgrounfView.frame)
//
//    }
    
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        decorateCell()
//        addSubview()
////        addProductImageSubview()
////        addBuyButtonSubview()
////        addCurrentPriceSubview()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

