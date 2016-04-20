//
//  TextContentViewCell.h
//  WeiBo
//
//  Created by 益平廖 on 16/4/20.
//  Copyright © 2016年 Liaoyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@protocol TextContentViewCellDelegate <NSObject>

- (void)textContentViewReloadWithIndexPath:(NSIndexPath *)indexpath;

- (void)textContentViewNextClickWithIndexPath:(NSIndexPath *)indexpath;


@end

@interface TextContentViewCell : UITableViewCell<UITextViewDelegate>

@property(nonatomic , strong)UITextView *textView;

@property(nonatomic , strong)Article *article;
@property(nonatomic , strong)NSIndexPath *indexPath;

@property(nonatomic , weak)id<TextContentViewCellDelegate> deleagte;


@end
