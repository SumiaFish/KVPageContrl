//
//  KVPageControl.m
//  SYJPMall
//
//  Created by kevin on 2020/7/5.
//  Copyright © 2020 kevin. All rights reserved.
//

#import "KVPageControl.h"

@implementation KVPageControl

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.s1 = CGSizeMake(8, 8);
    self.s2 = CGSizeMake(4, 4);
    self.space = 12;
    self.alignType = KVPageControlAlignType_Center;
    self.paddingLeft = 0;
    self.paddingRight = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self customLayout];
}

- (void)customLayout {
    if (!self.subviews.count) {
        return;
    }
    
    NSInteger count = self.subviews.count;
    CGSize s1 = self.s1;
    CGSize s2 = self.s2;
    CGFloat space = self.space;
    KVPageControlAlignType alignType = self.alignType;
    CGFloat paddingLeft = self.paddingLeft;
    CGFloat paddingRight = self.paddingRight;
    
    CGFloat x = paddingLeft;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    for (NSUInteger subviewIndex = 0; subviewIndex < count; subviewIndex++) {
        // get subview
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        
        // change frame
        if (subviewIndex == self.currentPage) {
            w = s1.width;
            h = s1.height;
        } else {
            w = s2.width;
            h = s2.height;
        }
        y = (self.bounds.size.height - h)/2;
        subview.frame = CGRectMake(x, y, w, h);
        subview.layer.cornerRadius = h/2;
        subview.clipsToBounds = YES;
        
        //
        x += w + space;
    }
    
    // fix align
    if (alignType == KVPageControlAlignType_Left) {
        return;
    }
    
    if (alignType == KVPageControlAlignType_Right) {
        CGFloat offsetX = self.bounds.size.width - paddingRight - CGRectGetMaxX(self.subviews.lastObject.frame);
        for (NSUInteger subviewIndex = 0; subviewIndex < count; subviewIndex++) {
            // get subview and other value
            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
            
            // change frame
            subview.frame = CGRectMake(subview.frame.origin.x + offsetX, subview.frame.origin.y, subview.frame.size.width, subview.frame.size.height);
        }
        return;
    }
    
    if (alignType == KVPageControlAlignType_Center) {
        CGFloat offsetX = self.bounds.size.width/2 - (CGRectGetMaxX(self.subviews.lastObject.frame) + paddingLeft - paddingRight)/2;
        for (NSUInteger subviewIndex = 0; subviewIndex < count; subviewIndex++) {
            // get subview and other value
            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
            
            // change frame
            subview.frame = CGRectMake(subview.frame.origin.x + offsetX, subview.frame.origin.y, subview.frame.size.width, subview.frame.size.height);
        }
        return;
    }
}

@end
