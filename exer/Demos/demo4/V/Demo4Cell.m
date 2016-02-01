//
//  Demo4Cell.m
//  exer
//
//  Created by 肖君 on 16/2/1.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo4Cell.h"

@implementation Demo4Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor grayColor];
        [self setupView];
    }
    return  self;
}

- (void)setupView {
    self.icon = [[UIImageView alloc] init];
    self.icon.backgroundColor = [UIColor greenColor];
    self.icon.contentMode = UIViewContentModeScaleToFill;
    
    self.name = [[UILabel alloc] init];
    self.name.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.name];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.mas_offset(10);
        make.top.equalTo(self.contentView).with.mas_offset(10);
        make.bottom.equalTo(self.contentView).with.mas_offset(-10);
        make.width.mas_equalTo(60);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.icon.mas_right).with.mas_offset(10);
        make.right.equalTo(self.contentView).with.mas_offset(-10);
        make.top.equalTo(self.contentView).with.mas_offset(10);
        make.bottom.equalTo(self.contentView).with.mas_offset(-10);
    }];
}

@end
