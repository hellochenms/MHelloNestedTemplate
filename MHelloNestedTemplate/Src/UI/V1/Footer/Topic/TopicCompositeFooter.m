//
//  TopicCompositeFooter.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/16.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TopicCompositeFooter.h"
#import "TopicCompositeFooterLayout.h"
#import "News+Layout.h"

@interface TopicCompositeFooter()
@property (nonatomic) UIButton *footerButton;
@end

@implementation TopicCompositeFooter
#pragma mark -
+ (Layout *)primitiveGenerateLayout {
    return [TopicCompositeFooterLayout new];
}

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        [self addSubview:self.footerButton];
    }
    
    return self;
}

#pragma mark -
- (void)primitiveConfigWithNews:(News *)news {
    TopicCompositeFooterLayout *layout = news.footerLayout;
    self.footerButton.frame = layout.footerButtonFrame;
    [self.footerButton setTitle:[NSString stringWithFormat:@"%@:footer-button", news.title] forState:UIControlStateNormal];
}

#pragma mark - Event
- (void)onTapFooterButton {
    if (self.onTapFooterButtonBlock) {
        self.onTapFooterButtonBlock(self.news);
    }
}

#pragma mark - Getter
- (UIButton *)footerButton{
    if(!_footerButton){
        _footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_footerButton addTarget:self action:@selector(onTapFooterButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerButton;
}

@end
