//
//  CollectionForMainViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit

class CollectionForMainViewController: UICollectionViewController {
    
    private enum Section: Int {
        case stories, specialOffers, bonusStatus, services, recomend, sweets
    }
    
    private typealias CollectionVieDiffableDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    private typealias DiffableDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    private var dataSource: CollectionVieDiffableDataSource!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.dataSource = createDataSource()

        var snapshot = DiffableDataSourceSnapshot()
        snapshot.appendSections([.stories, .specialOffers, .bonusStatus, .services, .recomend, .sweets])
        snapshot.appendItems(DataOfModels.stories, toSection: .stories)
        snapshot.appendItems(DataOfModels.specialOffers, toSection: .specialOffers)
        snapshot.appendItems(DataOfModels.bonusStatus, toSection: .bonusStatus)
        snapshot.appendItems(DataOfModels.services, toSection: .services)
        snapshot.appendItems(DataOfModels.recomendations, toSection: .recomend)
        snapshot.appendItems(DataOfModels.sweets, toSection: .sweets)
        dataSource.apply(snapshot)
    }
    
    
    private func createDataSource() -> CollectionVieDiffableDataSource {
        
        let storyCellRegistration = UICollectionView.CellRegistration<StoryCollectionViewCell, StoryModel> { cell, indexPath, item in
            cell.storyFooter.text = item.headerText
            cell.storyImageView.image = item.image
            cell.isRead = item.isRead
        }
        
        let specialOfferCellRegistration = UICollectionView.CellRegistration<SpecialOfferCollectionViewCell, SpecialOfferModel> { cell, indexPath, item in
            cell.specialOfferImageView.image = item.specialOfferImage
        }
        
        let bonusStatusCellRegistration = UICollectionView.CellRegistration<BonusStatusCollectionViewCell, BonusStatusModel> { cell, indexPath, item in
            cell.bonusStatus.text = "\(item.bounus) bonus"
        }
        
        let serviceCellRegistration = UICollectionView.CellRegistration<ServiceCollectionViewCell, ServiceModel> { cell, indexPath, item in
            cell.serviceTitle.text = item.serviceTitle
            cell.setColorForTitle(item.titleColorMode)
            cell.serviceImageView.image = item.serviceImage
        }
        
        let productCellRegistration = UICollectionView.CellRegistration<ProductCollectionViewCell, ProductModel> { cell, indexPath, item in
            cell.productModel = item
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            
            switch Section(rawValue: indexPath.section) {
            
            case .none:
                return nil
            
            case .some(.stories):
                let item = DataOfModels.stories[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: storyCellRegistration, for: indexPath, item: item)
                return cell
            
            case .some(.specialOffers):
                let item = DataOfModels.specialOffers[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: specialOfferCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.bonusStatus):
                let item = DataOfModels.bonusStatus[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: bonusStatusCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.services):
                let item = DataOfModels.services[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: serviceCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.recomend):

                let item = DataOfModels.recomendations[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.sweets):
                let item = DataOfModels.sweets[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
                return cell
            }
            

        }
        
        return dataSource
    }
    
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let compositionalLayout = UICollectionViewCompositionalLayout { [self] section, environment in
            
            switch Section(rawValue: section) {
            
            case .none:
                return nil
                
            case .some(.stories): return storiesSectionLayout()

            case .some(.specialOffers): return specialOffersSectionLayout()

            case .some(.bonusStatus): return bonusStatusSectionLayout()
                
            case .some(.services): return serviceSectionLayout()
                
            case .some(.recomend): return productSectionLayout()
    
            case .some(.sweets): return productSectionLayout()
            }

        }
        
        return compositionalLayout
    }

}

//MARK: Layout extansion

extension CollectionForMainViewController {
   
    private func storiesSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
    private func specialOffersSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
    private func bonusStatusSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
    private func serviceSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
    private func productSectionLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
}
