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
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.node.frame = self.contentView.bounds;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

#pragma mark - Public
+ (double)heightForNews:(News *)news {
    Class nodeClass = [LayoutMapping nodeClassForNews:news];
    double height = [nodeClass heightForNews:news];
    
    return height;
}

- (void)configWithNews:(News *)news {
    [self.node configWithNews:news];
}

@end
