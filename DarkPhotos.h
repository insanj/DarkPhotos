#import <UIKit/UIKit.h>

@interface PUGridRenderedStrip : UICollectionReusableView
- (int)backgroundColorValue;
@end

@interface PUPhotosSectionHeaderView : UICollectionReusableView
- (unsigned int)backgroundStyle;
- (void)_updateBackground;
- (void)_updateHighlightView;
@end

@interface PUFlatWhiteInterfaceTheme : NSObject
- (int)defaultKeyboardAppearance;
- (UIColor *)albumListBackgroundColor;
- (UIColor *)photoCollectionToolbarButtonTintColor;
- (UIColor *)topLevelNavigationBarButtonTintColor;
- (UIColor *)cloudFeedBackgroundColor;
- (UIStatusBarStyle)photoBrowserStatusBarStyle;
- (UIColor *)photoBrowserChromeHiddenBackgroundColor;
- (UIColor *)photoBrowserChromeVisibleBackgroundColor;
- (UIColor *)photoCollectionToolbarTintColor;
- (BOOL)photoCollectionToolbarTranslucent;
- (UIBarStyle)photoCollectionToolbarStyle;
- (int)photoCollectionViewBackgroundColorValue;
- (UIColor *)bannerBackgroundColor;
- (UIColor *)topLevelTabBarSelectedImageTintColor;
- (UIColor *)topLevelTabBarTintColor;
- (UIColor *)gridViewCellBannerTextColor;
- (UIColor *)gridViewCellBannerBackgroundColor;
- (UIColor *)topLevelNavigationBarTintColor;
- (BOOL)topLevelNavigationBarTranslucent;
- (UIBarStyle)topLevelNavigationBarStyle;
- (UIColor *)cloudFeedSeparatorColor;
- (UIColor *)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1;
- (UIColor *)emptyPlaceholderViewBackgroundColor;
- (UIStatusBarStyle)topLevelStatusBarStyle;
- (UIColor *)photoCollectionViewBackgroundColor;
@end
