#import <UIKit/UIKit.h>

%ctor{
    [UITabBar appearance].barStyle = UIBarStyleBlack;
    [UITableViewCell appearance].backgroundColor = [UIColor darkGrayColor];
}

@interface PUGridRenderedStrip : UICollectionReusableView
-(int)backgroundColorValue;
@end

@interface PUPhotosSectionHeaderView : UICollectionReusableView 
-(unsigned int)backgroundStyle;
-(void)_updateBackground;
-(void)_updateHighlightView;
@end

@interface PUFlatWhiteInterfaceTheme : NSObject
-(int)defaultKeyboardAppearance;
-(id)albumListBackgroundColor;
-(id)photoCollectionToolbarButtonTintColor;
-(id)topLevelNavigationBarButtonTintColor;
-(id)cloudFeedBackgroundColor;
-(int)photoBrowserStatusBarStyle;
-(id)photoBrowserChromeHiddenBackgroundColor;
-(id)photoBrowserChromeVisibleBackgroundColor;
-(id)photoCollectionToolbarTintColor;
-(BOOL)photoCollectionToolbarTranslucent;
-(int)photoCollectionToolbarStyle;
-(int)photoCollectionViewBackgroundColorValue;
-(id)bannerBackgroundColor;
-(id)topLevelTabBarSelectedImageTintColor;
-(id)topLevelTabBarTintColor;
-(id)gridViewCellBannerTextColor;
-(id)gridViewCellBannerBackgroundColor;
-(id)topLevelNavigationBarTintColor;
-(BOOL)topLevelNavigationBarTranslucent;
-(int)topLevelNavigationBarStyle;
-(id)cloudFeedSeparatorColor;
-(id)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1;
-(id)emptyPlaceholderViewBackgroundColor;
-(int)topLevelStatusBarStyle;
-(id)photoCollectionViewBackgroundColor;
@end

%hook PUGridRenderedStrip

-(int)backgroundColorValue{
    return 0;
}

%end

%hook PUPhotosSectionHeaderView

-(id)initWithFrame:(CGRect)arg1{
    PUPhotosSectionHeaderView *o = (PUPhotosSectionHeaderView *)%orig();
    o.backgroundColor = [UIColor darkGrayColor];
    return o;
}

-(void)_updateBackground{
    return;
}

%end

%hook PUFlatWhiteInterfaceTheme

-(id)albumListBackgroundColor{
    return [UIColor darkGrayColor];
}

-(id)cloudFeedBackgroundColor{
    return [UIColor darkGrayColor];
}

-(int)photoBrowserStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(id)photoBrowserChromeHiddenBackgroundColor{
    return [UIColor blackColor];
}

-(id)photoBrowserChromeVisibleBackgroundColor{
    return [UIColor blackColor];
}

-(BOOL)photoCollectionToolbarTranslucent{
    return YES;
}

-(int)photoCollectionToolbarStyle{
    return UIBarStyleBlack;
}

-(id)bannerBackgroundColor{
    return [UIColor darkGrayColor];
}

-(id)gridViewCellBannerTextColor{
    return [UIColor lightGrayColor];
}

-(id)gridViewCellBannerBackgroundColor{
    return [UIColor darkGrayColor];
}

-(BOOL)topLevelNavigationBarTranslucent{
    return YES;
}
 
-(int)topLevelNavigationBarStyle{
    return UIBarStyleBlack;
}

-(id)cloudFeedSeparatorColor{
    return [UIColor lightGrayColor];
}


-(id)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1{
    return [UIColor colorWithWhite:0.25 alpha:0.9];
}

-(id)emptyPlaceholderViewBackgroundColor{
    return [UIColor blackColor];
}

-(int)topLevelStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(id)photoCollectionViewBackgroundColor{
    return [UIColor blackColor];
}

%end

%hook PUAlbumListTableViewController

-(id)backgroundColorForTableView{
    return [UIColor blackColor];
}

%end