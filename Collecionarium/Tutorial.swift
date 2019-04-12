//
//  Tutorial.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/28/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

enum TutorialViewType {
    case Collection
    case Item
}

class Tutorial : UIView {
    
    init(frame: CGRect, type: TutorialViewType) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let lbl = UILabel(frame: CGRectMake(30, 0, frame.width - 60, frame.height))
        lbl.textAlignment = .Center
        lbl.font = UIFont.systemFontOfSize(20)
        lbl.textColor = UIColor.whiteColor()
        lbl.numberOfLines = 0
        lbl.text = (type == .Collection ? NSLocalizedString("NO_COLLECTION", comment: "") :
            (type == .Item ? NSLocalizedString("NO_ITEM", comment: "") : "Adicione um novo para começar"))
        
        let img = UIImageView(frame: CGRectMake(frame.width-65, 0, 75, 100))
        img.image = UIImage(named: "arrow1")
        
        self.addSubview(img)
        self.addSubview(lbl)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func standartView(frame: CGRect, text: String) -> UIView {
//        let view = UIView(frame: frame)
//        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
//        
//        let lbl = UILabel(frame: CGRectMake(30, 0, frame.width - 60, frame.height))
//        lbl.textAlignment = .Center
//        lbl.font = UIFont.systemFontOfSize(20)
//        lbl.textColor = UIColor.whiteColor()
//        lbl.numberOfLines = 0
//        lbl.text = text
//        
//        let img = UIImageView(frame: CGRectMake(frame.width-65, 0, 75, 100))
//        img.image = UIImage(named: "arrow1")
//        
//        view.addSubview(img)
//        view.addSubview(lbl)
//        
//        return view
//    }
//    
//    func noCollectionView(frame: CGRect) -> UIView {
//        return standartView(frame, text: "Você não tem nenhuma coleção, clique no botão '+' para adicionar uma")
//    }
//    
//    func noItemView(frame: CGRect) -> UIView {
//        return standartView(frame, text: "Você não tem nenhum item, clique no botão '+' para adicionar um")
//    }
}