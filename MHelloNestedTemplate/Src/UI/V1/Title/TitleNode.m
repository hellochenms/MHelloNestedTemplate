//
//  TitleNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleNode.h"
#import "TitleLayout.h"

@implementation TitleNode

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.titleLabel];
    }
    
    return self;
}

+ (Layout *)primitiveGenerateLayout {
    return [TitleLayout new];
}

- (void)primitiveConfigWithNews:(News *)news {
    self.titleLabel.text = news.title;
    
    TitleLayout *layout = news.layout;
    self.titleLabel.frame = layout.titleFrame;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (highlighted) {
        self.backgroundColor = [UIColor yellowColor];
    } else {
        self.backgroundColor = [UIColor redColor];
    }
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [TitleLayout titleFont];
        _titleLabel.numberOfLines = [TitleLayout titleMaxLineCount];
    }
    
    return _titleLabel;
}

@end
