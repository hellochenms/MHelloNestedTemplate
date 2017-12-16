//
//  Something.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface Something : UIView
@property (nonatomic) News *news;
- (void)configWithNews:(News *)news;
@end
