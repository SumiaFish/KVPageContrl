//
//  KVPageControl.h
//  SYJPMall
//
//  Created by kevin on 2020/7/5.
//  Copyright © 2020 kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KVPageControlAlignType) {
    KVPageControlAlignType_Center,
    KVPageControlAlignType_Left,
    KVPageControlAlignType_Right,
};

@interface KVPageControl : UIPageControl

/** current page view size: default (8, 8) */
@property (assign, nonatomic) CGSize s1;
/** normal page view size: default (4, 4) */
@property (assign, nonatomic) CGSize s2;
/** default: 12 */
@property (assign, nonatomic) CGFloat space;
/** default: 0 */
@property (assign, nonatomic) CGFloat paddingLeft;
/** default: 0 */
@property (assign, nonatomic) CGFloat paddingRight;
/** default: KVPageControlAlignType_Center  */
@property (assign, nonatomic) KVPageControlAlignType alignType;

@end

NS_ASSUME_NONNULL_END
