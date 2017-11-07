//
//  TitleImageCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleImageCell.h"
#import "TitleImageNode.h"
#import "TitleImageLayout.h"

@implementation TitleImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.node = [TitleImageNode new];
        [self.contentView addSubview:self.node];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [(TitleImageNode *)self.node setHighlighted:highlighted animated:animated];
}

@end
