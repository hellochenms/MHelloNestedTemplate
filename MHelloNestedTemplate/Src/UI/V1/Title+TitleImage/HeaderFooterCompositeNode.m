//
//  AACompositeNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/7.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "HeaderFooterCompositeNode.h"
#import "HeaderFooterCompositeLayout.h"

@interface HeaderFooterCompositeNode()
@property (nonatomic) UIView *footer;
@property (nonatomic) UIButton *footerButton;
@end

@implementation HeaderFooterCompositeNode
- (void)primitiveAddFooter {
    [self addSubview:self.footer];
}

- (void)primitiveLayoutFooterForNews:(News *)news {
    HeaderFooterCompositeLayout *layout = self.news.layout;
    self.footer.frame = layout.footerFrame;
    
    self.footerButton.frame = layout.footerButtonFrame;
}

+ (Layout *)primitiveGenerateLayout {
    return [HeaderFooterCompositeLayout new];
}

#pragma mark - Getter
- (UIView *)footer{
    if(!_footer){
        _footer = [[UIView alloc] init];
        _footer.backgroundColor = [UIColor grayColor];
        [_footer addSubview:self.footerButton];
    }
    return _footer;
}

- (UIButton *)footerButton{
    if(!_footerButton){
        _footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _footerButton.backgroundColor = [UIColor brownColor];
        [_footerButton setTitle:@"footer-点击查看更多" forState:UIControlStateNormal];
    }
    return _footerButton;
}

@end
