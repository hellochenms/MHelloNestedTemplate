//
//  TitleImageNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleImageNode.h"
#import "TitleImageLayout.h"

@implementation TitleImageNode
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
    }
    
    return self;
}

+ (Layout *)primitiveGenerateLayout {
    return [TitleImageLayout new];
}

- (void)primitiveConfigWithNews:(News *)news {
    TitleImageLayout *layout = news.layout;
    
    self.imageView.frame = layout.imageFrame;
    
    self.titleLabel.text = news.title;
    self.titleLabel.frame = layout.titleFrame;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (highlighted) {
        self.backgroundColor = [UIColor yellowColor];
    } else {
        self.backgroundColor = [UIColor blueColor];
    }
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [TitleImageLayout titleFont];
        _titleLabel.numberOfLines = [TitleImageLayout titleMaxLineCount];
    }
    
    return _titleLabel;
}

- (UIImageView *)imageView {
    if(!_imageView){
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor greenColor];
    }
    
    return _imageView;
}

@end
