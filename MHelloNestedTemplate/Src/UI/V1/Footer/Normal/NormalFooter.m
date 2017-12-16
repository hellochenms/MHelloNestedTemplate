//
//  NormalFooter.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NormalFooter.h"
#import "NormalFooterLayout.h"
#import "News+Layout.h"

@interface NormalFooter()
@end

@implementation NormalFooter
#pragma mark -
+ (Layout *)primitiveGenerateLayout {
    return [NormalFooterLayout new];
}

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.timeLabel];
    }
    
    return self;
}

#pragma mark -
- (void)primitiveConfigWithNews:(News *)news {
    NormalFooterLayout *layout = news.footerLayout;
    self.timeLabel.frame = layout.timeFrame;
}

#pragma mark - Getter
- (UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"几分钟前";
    }
    return _timeLabel;
}

@end
