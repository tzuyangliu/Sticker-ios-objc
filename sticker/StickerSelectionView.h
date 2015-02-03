//
//  StickerSelectionView.h
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sticker.h"

typedef void(^SelectStickerSuccessBlock)(Sticker *sticker);

@interface StickerSelectionView : UIView
@property (strong, nonatomic) SelectStickerSuccessBlock selectStickerSuccessBlock;
@end
