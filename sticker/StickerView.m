//
//  StickerView.m
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import "StickerView.h"
#import "Sticker.h"

@implementation StickerView

- (id)initWithSticker:(Sticker *)sticker{
    self = [super initWithImage:sticker.image];
    if (self){
        NSInteger x = arc4random_uniform(300);
        NSInteger y = arc4random_uniform(300);
        self.frame = CGRectMake(x, y, 100, 100);
    }
    return self;
}

@end
