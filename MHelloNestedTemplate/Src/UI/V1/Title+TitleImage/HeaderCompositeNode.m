//
//  HeaderCompositeNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/7.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "HeaderCompositeNode.h"
#import "HeaderCompositeLayout.h"

@interface HeaderCompositeNode()
@property (nonatomic) UIView *header;
@property (nonatomic) UILabel *headerTitleLabel;
@end

@implementation HeaderCompositeNode

- (void)primitiveAddHeader {
    [self addSubview:self.header];
}

- (void)primitiveLayoutHeaderForNews:(News *)news {
    HeaderCompositeLayout *layout = self.news.layout;
    self.header.frame = layout.headerFrame;
    
    self.headerTitleLabel.frame = layout.headerTitleFrame;
}

- (void)primitiveConfigHeaderWithNews:(News *)news {
    self.headerTitleLabel.text = [NSString stringWithFormat:@"%@:header-label", news.title];
}

+ (Layout *)primitiveGenerateLayout {
    return [HeaderCompositeLayout new];
}

#pragma mark - Getter
- (UIView *)header{
    if(!_header){
        _header = [[UIView alloc] init];
        _header.backgroundColor = [UIColor grayColor];
        [_header addSubview:self.headerTitleLabel];
    }
    return _header;
}

- (UILabel *)headerTitleLabel{
    if(!_headerTitleLabel){
        _headerTitleLabel = [[UILabel alloc] init];
        _headerTitleLabel.backgroundColor = [UIColor brownColor];
        _headerTitleLabel.textColor = [UIColor whiteColor];
        _headerTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headerTitleLabel;
}

@end
