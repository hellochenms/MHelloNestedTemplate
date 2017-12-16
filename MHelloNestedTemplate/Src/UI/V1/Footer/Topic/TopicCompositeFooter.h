//
//  TopicCompositeFooter.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/16.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Footer.h"
#import "News.h"

@interface TopicCompositeFooter : Footer
@property (nonatomic, copy) void(^onTapFooterButtonBlock)(News *news);
@end
