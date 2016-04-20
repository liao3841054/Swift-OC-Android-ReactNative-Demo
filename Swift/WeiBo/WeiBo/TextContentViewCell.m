//
//  TextContentViewCell.m
//  WeiBo
//
//  Created by 益平廖 on 16/4/20.
//  Copyright © 2016年 Liaoyp. All rights reserved.
//

#import "TextContentViewCell.h"

@implementation TextContentViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textView = [[UITextView alloc] initWithFrame:CGRectZero];
        _textView.backgroundColor = [UIColor lightGrayColor];
        _textView.delegate = self;
        [self.contentView addSubview:_textView];
    }
    return self;
}

- (void)setArticle:(Article *)article
{
    if ([article isKindOfClass:[Article class]]) {
        _article = article;
        _textView.text = _article.content;
        _article.cellHeight = [self getTextHeightWithText:_article.content font:[UIFont systemFontOfSize:14] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 2000) lineSpace:3].height;
        _textView.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width -20,  _article.cellHeight);
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text

{
    if ([text isEqualToString:@"\n"]) {
        
//        [textView resignFirstResponder];
        
        if (_deleagte && [_deleagte respondsToSelector:@selector(textContentViewNextClickWithIndexPath:)]) {
            [_deleagte textContentViewNextClickWithIndexPath:_indexPath];
        }
    
        return NO;
        
    }
    return YES;
    
}

#pragma mark Delegate

- (void)textViewDidChange:(UITextView *)textView
{
    // 通知刷新的
    _article.content = textView.text;
    
    _article.cellHeight = [self getTextHeightWithText:_article.content font:[UIFont systemFontOfSize:14] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 2000) lineSpace:3].height + 10;
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (_deleagte && [_deleagte respondsToSelector:@selector(textContentViewReloadWithIndexPath:)]) {
        [_deleagte textContentViewReloadWithIndexPath:_indexPath];
    }
}

- (CGSize)getTextHeightWithText:(NSString *)text
                           font:(UIFont *)font
                           size:(CGSize)size
                      lineSpace:(NSInteger)lineSpace
{
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [mutableDictionary setObject:font forKey:NSFontAttributeName];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpace];
    [mutableDictionary setObject:style forKey:NSParagraphStyleAttributeName];
    
    CGRect rect = [text boundingRectWithSize:size
                                     options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                  attributes:mutableDictionary
                                     context:nil];
    return rect.size;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
