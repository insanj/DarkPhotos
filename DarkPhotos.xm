#import "DarkPhotos.h"

// For global appearance changes. This method only works for standard UI elements,
// and in this case, the UITabBar and UITableViewCells.
%ctor  {
    [UITabBar appearance].barStyle = UIBarStyleBlack;
    [UITableViewCell appearance].backgroundColor = [UIColor darkGrayColor];
}

// "Moments" view background.
%hook PUGridRenderedStrip

- (int)backgroundColorValue {
    return 0;
}

%end

// Header view background (didn't choose black and white because, at the time, I
// cound't locate the specific color-changers for the text as well as backing).
%hook PUPhotosSectionHeaderView

- (id)initWithFrame:(CGRect)frame {
    PUPhotosSectionHeaderView *headerView = (PUPhotosSectionHeaderView *) %orig(frame);
    headerView.backgroundColor = [UIColor darkGrayColor];
    return headerView;
}

- (void)_updateBackground {
    return;
}

%end

// Should be self explanatory (thanks, Apple!)...
%hook PUFlatWhiteInterfaceTheme

- (UIColor *)albumListBackgroundColor {
    return [UIColor darkGrayColor];
}

- (UIColor *)cloudFeedBackgroundColor {
    return [UIColor darkGrayColor];
}

- (UIStatusBarStyle)photoBrowserStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIColor *)photoBrowserChromeHiddenBackgroundColor {
    return [UIColor blackColor];
}

- (UIColor *)photoBrowserChromeVisibleBackgroundColor {
    return [UIColor blackColor];
}

- (BOOL)photoCollectionToolbarTranslucent {
    return YES;
}

- (UIBarStyle)photoCollectionToolbarStyle {
    return UIBarStyleBlack;
}

- (UIColor *)bannerBackgroundColor {
    return [UIColor darkGrayColor];
}

- (UIColor *)gridViewCellBannerTextColor {
    return [UIColor lightGrayColor];
}

- (UIColor *)gridViewCellBannerBackgroundColor {
    return [UIColor darkGrayColor];
}

- (BOOL)topLevelNavigationBarTranslucent {
    return YES;
}

- (UIBarStyle)topLevelNavigationBarStyle {
    return UIBarStyleBlack;
}

- (UIColor *)cloudFeedSeparatorColor {
    return [UIColor lightGrayColor];
}

- (UIColor *)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1 {
    %log;
    return [UIColor colorWithWhite:0.25 alpha:0.9];
}

- (UIColor *)emptyPlaceholderViewBackgroundColor {
    return [UIColor blackColor];
}

- (UIStatusBarStyle)topLevelStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIColor *)photoCollectionViewBackgroundColor {
    return [UIColor blackColor];
}

%end

// Again, self-explanatory. Just the Album tab.
%hook PUAlbumListTableViewController

- (UIColor *)backgroundColorForTableView {
    return [UIColor blackColor];
}

%end
