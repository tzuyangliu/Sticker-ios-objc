//
//  StickerSelectionView.m
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import "StickerSelectionView.h"
#import "StickerCell.h"

@interface StickerSelectionView() <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *stickerArray;
@end
@implementation StickerSelectionView

#pragma mark - init

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.stickerArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 3; i++){
            Sticker *sticker = [[Sticker alloc] init];
            sticker.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", i]];
            [self.stickerArray addObject:sticker];
        }
    }
    return self;
}

#pragma mark - collectionview data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.stickerArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StickerCell" forIndexPath:indexPath];
    cell.sticker = self.stickerArray[indexPath.row];
    return cell;
}

#pragma mark - collectionview delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
    self.selectStickerSuccessBlock(self.stickerArray[indexPath.row]);
}

@end
