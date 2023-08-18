//
//  CollectionForMainViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit

class CollectionForMainViewController: UICollectionViewController {
    
    
    
    private typealias CollectionVieDiffableDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    private typealias DiffableDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    private enum Section: Int, CaseIterable {
        case stories
        case banners
        case bonus
        case services
        case recommend
        case sweets
    }
    
    private var dataSource: CollectionVieDiffableDataSource!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.dataSource = createDataSource()

        var snapshot = DiffableDataSourceSnapshot()
        snapshot.appendSections(Section.allCases)
        let storiesIDs = DataOfModels.stories.map { $0.id }
        snapshot.appendItems(storiesIDs, toSection: .stories)
        snapshot.appendItems(DataOfModels.specialOffers, toSection: .banners)
        snapshot.appendItems(DataOfModels.bonusStatus, toSection: .bonus)
        let servicesIDs = DataOfModels.services.map { $0.id }
        snapshot.appendItems(servicesIDs, toSection: .services)
        let recommendationsIDs = DataOfModels.recomendations.map {$0.id}
        snapshot.appendItems(recommendationsIDs, toSection: .recommend)
        snapshot.appendItems(DataOfModels.sweets, toSection: .sweets)
        dataSource.apply(snapshot)
    }
    
    
    private func createDataSource() -> CollectionVieDiffableDataSource {
        
        let storyCellRegistration = UICollectionView.CellRegistration<StoryCollectionViewCell, StoryModel> { cell, indexPath, itemModel in
            cell.itemModel = itemModel
        }
        
        let specialOfferCellRegistration = UICollectionView.CellRegistration<SpecialOfferCollectionViewCell, SpecialOfferModel> { cell, indexPath, item in
            cell.specialOfferImageView.image = item.specialOfferImage
        }
        
        let bonusStatusCellRegistration = UICollectionView.CellRegistration<BonusStatusCollectionViewCell, BonusStatusModel> { cell, indexPath, item in
            cell.bonusStatus.text = "\(item.bounus) bonus"
        }
        
//        let serviceCellRegistration = UICollectionView.CellRegistration<ServiceCollectionViewCell, ServiceModel> { cell, indexPath, item in
//            cell.serviceTitle.text = item.serviceTitle
//            cell.setColorForTitle(item.titleColorMode)
//            cell.serviceImageView.image = item.serviceImage
//        }
        
        let serviceCellRegistration = UICollectionView.CellRegistration<ServiceConfCollectionViewCell, ServiceModel> { cell, indexPath, item in
            cell.item = item
            }
        
        let productCellRegistration = UICollectionView.CellRegistration<ProductCollectionViewCell, ProductModel> { cell, indexPath, item in
            cell.item = item
        }
        
        let headerCellRegistration = UICollectionView.SupplementaryRegistration<CollectionViewSectionHeaderView>(elementKind: CollectionViewSectionHeaderView.elementKind) { supplementaryView, elementKind, indexPath in
            
            var title: String?
            
            switch Section(rawValue: indexPath.section) {
                
            case .recommend:
                title = "Рекомендуем"
            case .sweets:
                title = "Сладкое настроение"
            case .stories:
                title = nil
            case .banners:
                title = nil
            case .bonus:
                title = nil
            case .services:
                title = nil
            default:
                title = nil
            }
            
            supplementaryView.title.text = title
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            
            switch Section(rawValue: indexPath.section) {
            
            case .none:
                return nil
            
            case .some(.stories):
                //let item = DataOfModels.stories[indexPath.row]
                let itemModel = DataOfModels.stories.first(where: {$0.id == itemIdentifier as! UUID})
                let cell = collectionView.dequeueConfiguredReusableCell(using: storyCellRegistration, for: indexPath, item: itemModel)
                return cell
            
            case .some(.banners):
                let item = DataOfModels.specialOffers[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: specialOfferCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.bonus):
                let item = DataOfModels.bonusStatus[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: bonusStatusCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.services):
                //let item = DataOfModels.services[indexPath.row]
                let item = DataOfModels.services.first(where: {$0.id == itemIdentifier as! UUID} )
                let cell = collectionView.dequeueConfiguredReusableCell(using: serviceCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.recommend):

                let item = DataOfModels.recomendations.first(where: {$0.id == itemIdentifier as! UUID} )
                let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
                return cell
                
            case .some(.sweets):
                let item = DataOfModels.sweets[indexPath.row]
                let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: item)
                return cell
            }
            

        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            self.collectionView.dequeueConfiguredReusableSupplementary(using: headerCellRegistration, for: indexPath)
        }
        
        return dataSource
    }
    
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let compositionalLayout = UICollectionViewCompositionalLayout { [self] section, environment in
            
            switch Section(rawValue: section) {
            
            case .none:
                return nil
                
            case .some(.stories): return storiesSectionLayout()

            case .some(.banners): return specialOffersSectionLayout()

            case .some(.bonus): return bonusStatusSectionLayout()
                
            case .some(.services): return serviceSectionLayout()
                
            case .some(.recommend): return productSectionLayout()
    
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
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45.0))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CollectionViewSectionHeaderView.elementKind, alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
}
