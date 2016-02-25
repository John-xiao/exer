//
//  Demo11CarouselViewController.m
//  exer
//
//  Created by 肖君 on 16/2/25.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo11CarouselCell.h"
#import "Demo11CarouselViewController.h"

@interface Demo11CarouselViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,
                                           UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;
@end

@implementation Demo11CarouselViewController
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - 64)
                                             collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView setPagingEnabled:YES];
        [_collectionView registerClass:[Demo11CarouselCell class] forCellWithReuseIdentifier:CELL_ID_DEMO11_CAROUSEL];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews {
    [self.view addSubview:self.collectionView];
}

#pragma mark - CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell =
        [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID_DEMO11_CAROUSEL forIndexPath:indexPath];
    [self configureCell:(Demo11CarouselCell *)cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(Demo11CarouselCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.imageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0
                                                     green:arc4random_uniform(255) / 255.0
                                                      blue:arc4random_uniform(255) / 255.0
                                                     alpha:1];
}

#pragma mark - CollectionView Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kScreen_Width, kScreen_Height - 64);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
