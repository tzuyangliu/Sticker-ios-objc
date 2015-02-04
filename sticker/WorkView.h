//
//  WorkView.h
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Sticker;
@interface WorkView : UIView
- (BOOL)hasImage;
- (void)setBaseImage:(UIImage *)baseImage;

- (void)clearStickers;
- (void)addSticker:(Sticker *)sticker;

- (void)generateWithBlock:(void(^)(UIImage *finalImage, NSError *error))block;

@end
