//
//  Demo11CarouselCell.m
//  exer
//
//  Created by 肖君 on 16/2/25.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo11CarouselCell.h"

@implementation Demo11CarouselCell
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.center.mas_equalTo(self.contentView);
      make.width.height.mas_equalTo(300);
    }];
}
@end
