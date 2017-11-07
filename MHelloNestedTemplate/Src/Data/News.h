//
//  News.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NLayoutType) {
    NLayoutTypeTitle,
    NLayoutTypeTitleImage,
    NLayoutTypeComposite,
};

@interface News : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageURLString;
@property (nonatomic) NSArray<News *> *subNewses;
- (NLayoutType)layoutType;
@end
