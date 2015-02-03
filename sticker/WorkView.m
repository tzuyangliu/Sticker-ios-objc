//
//  WorkView.m
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import "WorkView.h"
#import "StickerView.h"

#import "Sticker.h"

@interface WorkView()
@property (weak, nonatomic) IBOutlet UIImageView *baseImageView;

@property (strong, nonatomic) UIImage *baseImage;

@property (strong, nonatomic) NSMutableArray *stickerViewArray;
@end

@implementation WorkView

#pragma mark - init

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.stickerViewArray = [@[] mutableCopy];
    }
    return self;
}

#pragma mark - base image

- (void)setBaseImage:(UIImage *)baseImage{
    [self clearStickers];
    _baseImage = baseImage;
    self.baseImageView.image = baseImage;
}

#pragma mark - sticker

- (void)addSticker:(Sticker *)sticker{
    StickerView *newStickerView = [[StickerView alloc] initWithSticker:sticker];
    [self.stickerViewArray addObject:newStickerView];
    [self addSubview:newStickerView];
}

- (void)clearStickers{
    for (StickerView *stickerView in self.stickerViewArray){
        [stickerView removeFromSuperview];
    }
    [self.stickerViewArray removeAllObjects];
}

#pragma mark - generate

- (void)generateWithBlock:(void (^)(UIImage *, NSError *))block{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, YES, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.baseImage drawInRect:self.bounds];
    for (StickerView *stickerView in self.stickerViewArray) {
        CGContextSaveGState(context);
        UIImage *image = [(UIImageView *)stickerView.contentView image];
        UIImageView *view = [[UIImageView alloc] initWithFrame:stickerView.frame];
        view.image = image;
        // Center the context around the view's anchor point
        CGContextTranslateCTM(context, [view center].x, [view center].y);
        // Apply the view's transform about the anchor point
        CGContextConcatCTM(context, [view transform]);
        // Offset by the portion of the bounds left of and above the anchor point
        CGContextTranslateCTM(context,
                              -[view bounds].size.width * [[view layer] anchorPoint].x,
                              -[view bounds].size.height * [[view layer] anchorPoint].y);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        CGContextRestoreGState(context);
    }
    UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    block(ret, nil);
}

@end
