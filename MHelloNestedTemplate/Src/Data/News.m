//
//  News.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "News.h"

@implementation News
- (NLayoutType)layoutType {
    if (self.subNewses && [self.subNewses count] > 0) {
        return NLayoutTypeComposite;
    } else if (self.images && [self.images count] > 0) {
        return NLayoutTypeFriends;
    } else if(self.imageURLString && [self.imageURLString length] > 0) {
        return NLayoutTypeTitleImage;
    } else {
        return NLayoutTypeTitle;
    }
}

@end
