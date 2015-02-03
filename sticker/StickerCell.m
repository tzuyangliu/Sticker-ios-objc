//
//  StickerCell.m
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import "StickerCell.h"
#import "Sticker.h"

@interface StickerCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation StickerCell

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.layer.borderWidth = 1.f;
    }
    return self;
}

- (void)setSticker:(Sticker *)sticker{
    _sticker = sticker;
    self.imageView.image = sticker.image;
}

@end
