//
//  TopicCompositeHeader.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TopicCompositeHeader.h"
#import "TopicCompositeHeaderLayout.h"
#import "News+Layout.h"

@interface TopicCompositeHeader()
@property (nonatomic) UILabel *headerTitleLabel;
@end

@implementation TopicCompositeHeader
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        [self addSubview:self.headerTitleLabel];
    }
    
    return self;
}

#pragma mark -
- (void)primitiveConfigWithNews:(News *)news {
    TopicCompositeHeaderLayout *layout = news.headerLayout;
    self.headerTitleLabel.frame = layout.headerTitleFrame;
    self.headerTitleLabel.text = [NSString stringWithFormat:@"%@:header-label", news.title];
}

#pragma mark -
+ (Layout *)primitiveGenerateLayout {
    return [TopicCompositeHeaderLayout new];
}

#pragma mark - Getter
- (UILabel *)headerTitleLabel {
    if(!_headerTitleLabel){
        _headerTitleLabel = [[UILabel alloc] init];
        _headerTitleLabel.textColor = [UIColor whiteColor];
        _headerTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _headerTitleLabel;
}

@end
