//
//  FriendsLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/12.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NodeLayout.h"

@interface FriendsLayout : NodeLayout
@property (nonatomic) CGRect titleFrame;
@property (nonatomic) CGRect unFoldFrame;
@property (nonatomic) CGRect imagesContainerFrame;
@property (nonatomic) CGSize bigImageSize;
@property (nonatomic) CGSize middleImageSize;
@property (nonatomic) CGSize smallImageSize;
+ (UIFont *)titleFont;
+ (NSInteger)titleMaxLineCount;
+ (double)middleItemBetween;
+ (double)smallItemBetween;
@end
