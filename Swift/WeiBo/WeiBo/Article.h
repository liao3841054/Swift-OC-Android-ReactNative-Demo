//
//  Article.h
//  WeiBo
//
//  Created by 益平廖 on 16/4/20.
//  Copyright © 2016年 Liaoyp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,LYPArticleType) {
    LYPArticleTextView,
    LYPArticleImage,
    LYPArticleLink,
};

@interface Article : NSObject

@property(nonatomic, assign) LYPArticleType type;
@property(nonatomic, assign) float cellHeight;

@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) UIImage  *image;

@end
