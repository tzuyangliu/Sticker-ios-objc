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
    NSInteger x = arc4random_uniform(200);
    NSInteger y = arc4random_uniform(200);
    self = [super initWithFrame:CGRectMake(x, y, 100, 100)];
    if (self){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = sticker.image;
        self.contentView = imageView;
    }
    return self;
}

@end
