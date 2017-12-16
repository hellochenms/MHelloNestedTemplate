//
//  FriendsNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/12.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "FriendsNode.h"
#import "FriendsLayout.h"

@interface FriendsNode()
@property (nonatomic) UIImageView *imageView0;
@property (nonatomic) UIView *imagesContainer;
@property (nonatomic) UIButton *unFoldButton;
@end

@implementation FriendsNode
- (void)primitiveAddBodyContainerSubViews:(UIView *)bodyContainer {
    [bodyContainer addSubview:self.titleLabel];
    [bodyContainer addSubview:self.unFoldButton];
    [bodyContainer addSubview:self.imagesContainer];
}

+ (Layout *)primitiveGenerateLayout {
    return [FriendsLayout new];
}

- (void)primitiveConfigBodyContainerForNews:(News *)news {
    self.titleLabel.text = news.title;
    
    FriendsLayout *layout = news.layout;
    self.titleLabel.frame = layout.titleFrame;
    
    self.unFoldButton.frame = layout.unFoldFrame;
    [self.unFoldButton setTitle:(news.isTitleUnFold ? @"收起" : @"全文") forState:UIControlStateNormal];

    [[self.imagesContainer subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
        [subView removeFromSuperview];
    }];
    
    NSInteger imageCount = [news.images count];
    if (imageCount == 0) {
        self.imagesContainer.frame = layout.imagesContainerFrame;
    } else if(imageCount == 1) {
        self.imagesContainer.frame = layout.imagesContainerFrame;
        
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor redColor];
        imageView.frame = CGRectMake(0, 0, layout.bigImageSize.width, layout.bigImageSize.height);
        [self.imagesContainer addSubview:imageView];
    } else if(imageCount <= 4) {
        self.imagesContainer.frame = layout.imagesContainerFrame;
        
        double itemWidth = layout.middleImageSize.width;
        double itemHeight = layout.middleImageSize.height;
//        double itemBetween = [FriendsLayout middleItemBetween];
        double itemBetween = [FriendsLayout smallItemBetween];
        
        for (NSInteger i = 0; i < imageCount; i++) {
            UIImageView *imageView = [UIImageView new];
            imageView.backgroundColor = [UIColor greenColor];
            NSInteger row = i / 2;
            NSInteger column = i % 2;
            imageView.frame = CGRectMake((itemWidth + itemBetween) * column, (itemHeight + itemBetween) * row, itemWidth, itemHeight);
            [self.imagesContainer addSubview:imageView];
        }
    } else {
        self.imagesContainer.frame = layout.imagesContainerFrame;
        
        if (imageCount > 9) {
            imageCount = 9;
        }
        double itemWidth = layout.smallImageSize.width;
        double itemHeight = layout.smallImageSize.height;
        double itemBetween = [FriendsLayout smallItemBetween];
        
        for (NSInteger i = 0; i < imageCount; i++) {
            UIImageView *imageView = [UIImageView new];
            imageView.backgroundColor = [UIColor blueColor];
            NSInteger row = i / 3;
            NSInteger column = i % 3;
            imageView.frame = CGRectMake((itemWidth + itemBetween) * column, (itemHeight + itemBetween) * row, itemWidth, itemHeight);
            [self.imagesContainer addSubview:imageView];
        }
    }
}

//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
//    if (highlighted) {
//        self.backgroundColor = [UIColor yellowColor];
//    } else {
//        self.backgroundColor = [UIColor redColor];
//    }
//}

#pragma mark - Event
- (void)onTapUnFold {
    self.news.isTitleUnFold = !self.news.isTitleUnFold;
    [self.news mh_cleanLayout];
    if (self.onTapUnfoldBlock) {
        self.onTapUnfoldBlock();
    }
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [FriendsLayout titleFont];
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor orangeColor];
    }
    
    return _titleLabel;
}

- (UIImageView *)imageView0 {
    if(!_imageView0){
        _imageView0 = [UIImageView new];
        _imageView0.backgroundColor = [UIColor brownColor];
    }

    return _imageView0;
}

- (UIView *)imagesContainer{
    if(!_imagesContainer){
        _imagesContainer = [[UIView alloc] init];
        _imagesContainer.backgroundColor = [UIColor grayColor];
    }
    return _imagesContainer;
}

- (UIButton *)unFoldButton{
    if(!_unFoldButton){
        _unFoldButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_unFoldButton addTarget:self action:@selector(onTapUnFold) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unFoldButton;
}

@end
