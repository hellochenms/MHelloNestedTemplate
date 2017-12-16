//
//  TitleNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleNode.h"
#import "TitleLayout.h"
#import "NormalFooter.h"

@interface TitleNode()
@property (nonatomic) UIButton *unFoldButton;
@end

@implementation TitleNode
- (void)primitiveAddBodyContainerSubViews:(UIView *)bodyContainer {
    [bodyContainer addSubview:self.titleLabel];
    [bodyContainer addSubview:self.unFoldButton];
}

+ (Layout *)primitiveGenerateLayout {
    return [TitleLayout new];
}

- (void)primitiveConfigBodyContainerForNews:(News *)news {
    self.titleLabel.text = news.title;
    
    TitleLayout *layout = news.layout;
    self.titleLabel.frame = layout.titleFrame;
    
    self.unFoldButton.frame = layout.unFoldFrame;
    [self.unFoldButton setTitle:(news.isTitleUnFold ? @"收起" : @"全文") forState:UIControlStateNormal];
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
        _titleLabel.font = [TitleLayout titleFont];
        _titleLabel.numberOfLines = 0;
    }
    
    return _titleLabel;
}

- (UIButton *)unFoldButton{
    if(!_unFoldButton){
        _unFoldButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_unFoldButton addTarget:self action:@selector(onTapUnFold) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unFoldButton;
}

@end
