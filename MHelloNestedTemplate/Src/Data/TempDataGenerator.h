//
//  TempDataGenerator.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface TempDataGenerator : NSObject
+ (NSArray<News *> *)newses;
@end
