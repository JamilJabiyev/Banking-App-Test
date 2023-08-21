//
//  CardCollectionViewCell + Ext.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 18.08.23.
//

import UIKit

// MARK: - Collection View Extension

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardCellIdentifier, for: indexPath) as! CardCollectionViewCell
        cell.backgroundColor = .blue // Цвет ячейки (вы можете настраивать в соответствии с вашим дизайном)
        cell.layer.cornerRadius = 16
        
//        cell.configure(title: cards[indexPath.row], isSelected: false)
        cell.configure(cards[indexPath.row])
//        String(cards[indexPath.row].balance.appendDollar())
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 56, height: collectionView.frame.height)
    }
}



extension Double {
    func appendDollar() -> String {
        return "$ \(self)"
    }
}
