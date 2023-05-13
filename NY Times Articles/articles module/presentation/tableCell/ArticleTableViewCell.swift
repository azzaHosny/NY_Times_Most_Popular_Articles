//
//  ArticleTableViewCell.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 14/05/2023.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    static let identifier = "ArticleTableViewCell"
    @IBOutlet weak var articlTitleLabel: UILabel!
    
    @IBOutlet weak var articleWriterLabel: UILabel!
    
    @IBOutlet weak var articleSectionLabel: UILabel!
    
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(article: ArticleUIModel) {
        articleWriterLabel.text = article.byline
        articlTitleLabel.text = article.title
        articleSectionLabel.text = article.section
        publishedDateLabel.text = article.publishedDate
    }
    
}
