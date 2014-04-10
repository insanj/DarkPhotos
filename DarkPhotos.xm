#import "DarkPhotos.h"

// For global appearance changes. This method only works for standard
// UI elements, and in this case, the UITabBar and UITableViewCells.
%ctor {
    [UITabBar appearance].barStyle = UIBarStyleBlack;
    [UITableViewCell appearance].backgroundColor = [UIColor darkGrayColor];
}

// Although this is a pretty sleazy thing to do, it applies properly in all cases,
// and doesn't slow down running time by very much. Let it slide, guru.
static BOOL sendingFromWhite = NO, sendingFromBlack = NO;
%hook UIColor

+ (UIColor *)whiteColor {
    if (!sendingFromBlack) {
        sendingFromWhite = YES;
        UIColor *replacement = [UIColor blackColor];
        sendingFromWhite = NO;

        return replacement;
    }

    return %orig();
}

+ (UIColor *)blackColor {
    if (!sendingFromWhite) {
        sendingFromBlack = YES;
        UIColor *replacement = [UIColor whiteColor];
        sendingFromBlack = NO;

        return replacement;
    }

    return %orig();
}

%end


// "Moments" view background.
//%hook PUGridRenderedStrip

//- (int)backgroundColorValue {
//    return 0;
//}

//%end

// Replaces and prevents updating of collection/tableview header background colors.
%hook PUPhotosSectionHeaderView

- (id)initWithFrame:(CGRect)frame {
    PUPhotosSectionHeaderView *headerView = (PUPhotosSectionHeaderView *) %orig(frame);
    headerView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.8];
    return headerView;
}

- (void)_updateBackground {
    return;
}

%end

// Should be self explanatory (thanks, Apple!)...
%hook PUFlatWhiteInterfaceTheme

- (UIColor *)albumListBackgroundColor {
    return [UIColor whiteColor];            // Remember, these are reversed!
}

//- (UIColor *)cloudFeedBackgroundColor {
//    return [UIColor darkGrayColor];
//}

- (UIStatusBarStyle)photoBrowserStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
/*
- (UIColor *)photoBrowserChromeHiddenBackgroundColor {
    return [UIColor blackColor];
}

- (UIColor *)photoBrowserChromeVisibleBackgroundColor {
    return [UIColor blackColor];
}
*/
//- (BOOL)photoCollectionToolbarTranslucent {
//    return YES;
//}

- (UIBarStyle)photoCollectionToolbarStyle {
    return UIBarStyleBlack;
}

//- (UIColor *)bannerBackgroundColor {
//    return [UIColor darkGrayColor];
//}

//- (UIColor *)gridViewCellBannerTextColor {
//    return [UIColor lightGrayColor];
//}

//- (UIColor *)gridViewCellBannerBackgroundColor {
//    return [UIColor darkGrayColor];
//}

//- (BOOL)topLevelNavigationBarTranslucent {
//    return YES;
//}

- (UIBarStyle)topLevelNavigationBarStyle {
    return UIBarStyleBlack;
}

//- (UIColor *)cloudFeedSeparatorColor {
//    return [UIColor lightGrayColor];
//}
/*
- (UIColor *)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1 {
    return [UIColor blackColor];//[UIColor colorWithWhite:0.25 alpha:0.9];
}

- (UIColor *)emptyPlaceholderViewBackgroundColor {
    return [UIColor blackColor];
}
*/
- (UIStatusBarStyle)topLevelStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
/*
- (UIColor *)photoCollectionViewBackgroundColor {
    return [UIColor blackColor];
}
*/
%end
/*
// Again, self-explanatory. Just the Album tab.
%hook PUAlbumListTableViewController

- (UIColor *)backgroundColorForTableView {
    return [UIColor blackColor];
}

%end
*/
