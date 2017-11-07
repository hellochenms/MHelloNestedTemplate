//
//  News+Layout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "News.h"
#import "Layout.h"

@interface News (Layout)
@property (nonatomic) __kindof Layout *layout;
- (void)mh_cleanLayout;
@end
