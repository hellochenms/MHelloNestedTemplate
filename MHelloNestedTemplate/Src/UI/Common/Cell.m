//
//  Cell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Cell.h"
#import "LayoutMapping.h"

@implementation Cell
#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.node = [[self primitiveNodeClass] new];
        [self.contentView addSubview:self.node];
    }
    
    return self;
}


- (Class)primitiveNodeClass {
    return [Node class];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.node.frame = self.contentView.bounds;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [self.node setHighlighted:highlighted animated:animated];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

#pragma mark - Public
+ (double)heightForNews:(News *)news {
    double height = [Node heightForNews:news];
    
    return height;
}

- (void)configWithNews:(News *)news {
    [self.node configWithNews:news];
}

@end
