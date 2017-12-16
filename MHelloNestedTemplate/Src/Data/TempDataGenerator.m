//
//  TempDataGenerator.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TempDataGenerator.h"
#import "Image.h"

@implementation TempDataGenerator
+ (NSArray<News *> *)newses {
    NSMutableArray<News *> *newses = [NSMutableArray<News *> array];
    for (NSInteger i = 0; i < 40; i++) {
        News *news = [News new];
        news.nid = i;
        news.title = [NSString stringWithFormat:@"%ld:%@", news.nid, [self randomLengthTitle]];
        
        if (i % 2 == 0) {
            news.imageURLString = @"https://www.baidu.com/img/bd_logo1.png";
        }
        
        if (i % 5 == 0) {
            NSInteger imageCount = arc4random() % 11;
            NSMutableArray<Image *> *images = [NSMutableArray array];
            for (NSInteger i = 0; i < imageCount; i++) {
                Image *image = [Image new];
                image.imageURLString = @"https://www.baidu.com/img/bd_logo1.png";
                image.width = ((NSInteger)arc4random() % 500) - 100;
                image.height = ((NSInteger)arc4random() % 500) - 100;
                [images addObject:image];
            }
            news.images = images;
        }
        
        if (i % 10 == 0) {
            news.title = [NSString stringWithFormat:@"GroupTitlte:%ld", i];

            NSMutableArray<News *> *subNewses = [NSMutableArray<News *> array];

            News *subNews = [News new];
            subNews.nid = i * 100;
            subNews.title = [NSString stringWithFormat:@"sub1-%ld:%@", subNews.nid, [self randomLengthTitle]];
            subNews.imageURLString = @"https://www.baidu.com/img/bd_logo1.png";
            [subNewses addObject:subNews];

            subNews = [News new];
            subNews.nid = i * 100 + 1;
            subNews.title = [NSString stringWithFormat:@"sub2-%ld:%@", subNews.nid, [self randomLengthTitle]];
            [subNewses addObject:subNews];

            news.subNewses = subNewses;
        }

        [newses addObject:news];
    }
    
    return [newses copy];
}

#pragma mark - Tools
+ (NSString *)randomLengthTitle {
    NSInteger count = arc4random() % 20 + 5;
    NSMutableString *title = [NSMutableString stringWithString:@"^"];
    for (NSInteger i = 0; i < count; i++) {
        [title appendString:@"hello你好"];
    }
    [title appendString:@"$"];
    
    return [title copy];
}

@end
