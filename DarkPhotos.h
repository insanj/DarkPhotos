#import <UIKit/UIKit.h>

@interface SBApplication : UIApplication
- (id)bundleIdentifier;
- (id)_defaultImageInfoForScreen:(id)screen launchingOrientation:(int)orientation;
- (id)_defaultImageName:(id)name;
- (id)_defaultPNGForScreen:(id)screen launchingOrientation:(int)orientation orientation:(int *)orientation3;
- (id)_defaultPNGImageInfoForScreen:(id)screen launchingOrientation:(int)orientation;
- (id)_defaultPNGNameFromActivationSettings;
- (id)_defaultPNGNameFromSearchDomainLaunchInfo:(id)searchDomainLaunchInfo;
- (id)_defaultPNGNameFromSuspensionSettings;
- (id)_defaultPNGNameUsingFallbacks:(id)fallbacks;
- (id)_defaultPNGNameWhenActivatingFromURLSetting:(id)urlsetting;
- (id)_defaultPNGPathForScreen:(id)screen launchingOrientation:(int)orientation imageOrientation:(int *)orientation3 resultingScale:(float *)scale;
@end

@interface PhotosApplication : UIApplication
@end

@interface PUBackgroundColorView : UIView
- (void)setBackgroundColor:(id)arg1;
@end

@interface PUGridRenderedStrip : UICollectionReusableView
- (int)backgroundColorValue;
@end

@interface PUPhotosSectionHeaderView : UICollectionReusableView
- (unsigned int)backgroundStyle;
- (void)_updateBackground;
- (void)_updateHighlightView;
@end

@interface PLAlbumStreamingOptionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@end

@interface PUAlbumListTableViewCell : UITableViewCell
@end

@interface PUAlbumListCellContentView : UIView <UITextFieldDelegate>

@property(setter=_setTitleTextField:,retain) UITextField * _titleTextField;
@property(setter=_setSubtitleLabel:,retain) UILabel * _subtitleLabel;
@property(setter=_setDeleteButton:,retain) UIButton * _deleteButton;
@end

@interface PUFlatWhiteInterfaceTheme : NSObject

- (int)defaultKeyboardAppearance;
- (id)sharedAlbumCommentCardAlbumTitleFont;
- (id)sharedAlbumCommentCardButtonFont;
- (id)cloudFeedSectionHeaderBackgroundImage;
- (id)cloudFeedWhiteEmphasizedTextAttributes;
- (id)cloudFeedWhiteDefaultTextAttributes;
- (id)wallpaperCategoryLabelFont;
- (id)toolbarCommentsShownButtonImageColor;
- (id)toolbarCommentsShownButtonTextAttributes;
- (id)toolbarCommentsHiddenButtonImageColor;
- (id)toolbarCommentsHiddenButtonTextAttributes;
- (UIEdgeInsets)contentCommentsButtonImageInset;
- (id)contentCommentsHiddenButtonTextAttributes;
- (id)albumListBackgroundColor;
- (id)photoCollectionToolbarButtonTintColor;
- (id)topLevelNavigationBarButtonTintColor;
- (void)configureCloudFeedCommentButton:(id)arg1 withCount:(int)arg2;
- (id)createCloudFeedCommentButton;
- (id)photoCollectionToolbarDeleteButtonBackgroundImageForState:(unsigned int)arg1 barMetrics:(int)arg2;
- (id)photoCollectionToolbarButtonBackgroundImageForState:(unsigned int)arg1 barMetrics:(int)arg2;
- (UIOffset)photoCollectionToolbarButtonTitlePositionAdjustmentforBarMetrics:(int)arg1;
- (id)photoCollectionToolbarDeleteButtonTitleTextAttributesForState:(unsigned int)arg1;
- (id)photoCollectionToolbarButtonTitleTextAttributesForState:(unsigned int)arg1;
- (id)topLevelNavigationBarDoneButtonBackgroundImageForState:(unsigned int)arg1 barMetrics:(int)arg2;
- (id)topLevelNavigationBarBackButtonBackgroundImageForState:(unsigned int)arg1 barMetrics:(int)arg2;
- (id)topLevelNavigationBarButtonBackgroundImageForState:(unsigned int)arg1 barMetrics:(int)arg2;
- (UIOffset)topLevelNavigationBarButtonTitlePositionAdjustmentforBarMetrics:(int)arg1;
- (id)topLevelNavigationBarDoneButtonTitleTextAttributesForState:(unsigned int)arg1;
- (id)topLevelNavigationBarButtonTitleTextAttributesForState:(unsigned int)arg1;
- (id)commentsButtonStringForCount:(int)arg1;
- (UIEdgeInsets)commentsButtonTextInset;
- (id)contentCommentsShownButtonTextAttributes;
- (id)contentCommentsShownButtonImageColor;
- (id)contentCommentsHiddenButtonImageColor;
- (id)_commentsFont;
- (id)albumListSubtitleLabelFont;
- (id)albumListTitleLabelFont;
- (id)_themeImageWithBaseName:(id)arg1;
- (id)themeImagePrefix;
- (void)configureCloudFeedStackView:(id)arg1 withStackSize:(CGSize)arg2;
- (id)cloudFeedBackgroundColor;
- (int)photoBrowserStatusBarStyle;
- (float)videoPaletteBottomMargin;
- (float)videoPaletteSideMargin;
- (id)photoBrowserChromeHiddenBackgroundColor;
- (id)photoBrowserChromeVisibleBackgroundColor;
- (id)photoCollectionToolbarBackgroundImageForBarMetrics:(int)arg1;
- (id)photoCollectionToolbarShadowImage;
- (id)photoCollectionToolbarTintColor;
- (BOOL)photoCollectionToolbarTranslucent;
- (int)photoCollectionToolbarStyle;
- (void)configurePhotoCollectionGlobalFooterSubtitleLabel:(id)arg1;
- (void)configurePhotoCollectionGlobalFooterTitleLabel:(id)arg1;
- (int)photoCollectionViewBackgroundColorValue;
- (float)bannerHeight;
- (id)bannerBackgroundColor;
- (void)configureBannerLabel:(id)arg1;
- (void)configureBannerStackView:(id)arg1;
- (id)topLevelTabBarItemTitleTextAttributesForState:(unsigned int)arg1;
- (id)topLevelTabBarBackgroundImage;
- (id)topLevelTabBarSelectedImageTintColor;
- (id)topLevelTabBarSelectionIndicatorImage;
- (id)topLevelTabBarShadowImage;
- (id)topLevelTabBarTintColor;
- (void)configureTopLevelTabBarItem:(id)arg1 withBaseName:(id)arg2;
- (id)gridViewCellBannerTextColor;
- (id)gridViewCellBannerTextFont;
- (id)gridViewCellBannerBackgroundColor;
- (id)gridViewCellBannerBackgroundImage;
- (id)sharedAlbumCommentCardTitleFont;
- (id)attributedStringForCloudFeedGroupHeaderWithText:(id)arg1;
- (id)cloudFeedInteractionTextAttributes;
- (id)cloudFeedInteractionLargerTextAttributes;
- (id)cloudFeedMiniChevronImage;
- (id)cloudFeedEmphasizedTextAttributes;
- (id)cloudFeedLargerEmphasizedTextAttributes;
- (id)cloudFeedDefaultTextAttributes;
- (id)cloudFeedLargerDefaultTextAttributes;
- (id)topLevelNavigationBarBackgroundImageForBarMetrics:(int)arg1;
- (id)topLevelNavigationBarShadowImage;
- (id)topLevelNavigationBarTitleTextAttributes;
- (id)topLevelNavigationBarTintColor;
- (BOOL)topLevelNavigationBarTranslucent;
- (int)topLevelNavigationBarStyle;
- (id)sharedAlbumCommentCardTextFont;
- (void)configureMapViewAnnotationCountLabel:(id)arg1;
- (void)configureAlbumListEmptyStackViewPadPhotoDecoration:(id)arg1;
- (void)configureAlbumListStackViewPadPhotoDecoration:(id)arg1;
- (void)configureAlbumListEmptyStackViewPhonePhotoDecoration:(id)arg1;
- (void)configureAlbumListStackViewPhonePhotoDecoration:(id)arg1;
- (id)cloudFeedInvitationSubtitleTextAttributes;
- (id)cloudFeedInvitationTitleTextAttributes;
- (float)cloudFeedSeparatorHeight;
- (id)cloudFeedSeparatorColor;
- (void)configureCloudFeedInvitationReplyButton:(id)arg1;
- (UIOffset)photoCollectionHeaderLocationIconOffsetForStyle:(int)arg1;
- (id)photoCollectionHeaderActionButtonFontForStyle:(int)arg1;
- (id)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1;
- (id)photoCollectionHeaderActionButtonAttributesForStyle:(int)arg1;
- (void)configurePhotoCollectionHeaderDateLabel:(id)arg1 forStyle:(int)arg2;
- (id)photoCollectionHeaderLocationIconForStyle:(int)arg1;
- (BOOL)photoCollectionHeaderSecondaryLabelsAllCapsForStyle:(int)arg1;
- (void)configurePhotoCollectionHeaderLocationsLabel:(id)arg1 forStyle:(int)arg2;
- (void)configurePhotoCollectionHeaderTitleLabel:(id)arg1 forStyle:(int)arg2;
- (float)albumListDisabledAlbumTitleAlpha;
- (float)albumListDisabledAlbumStackViewAlpha;
- (void)configureAlbumListDeleteButton:(id)arg1;
- (void)configureAlbumListSubtitleLabel:(id)arg1;
- (void)configureAlbumListTitleTextField:(id)arg1;
- (id)emptyPlaceholderViewBackgroundColor;
- (unsigned int)emptyPlaceholderStyle;
- (void)configureTopLevelNavigationBarButton:(id)arg1;
- (void)configureTopLevelNavigationBarDoneButton:(id)arg1;
- (int)topLevelStatusBarStyle;
- (id)photoCollectionViewBackgroundColor;
- (float)photoCollectionToolbarIconToTextSpacerWidth;
- (float)photoCollectionToolbarTextTitleSpacerWidth;
- (void)configurePhotoCollectionToolbarDeleteButton:(id)arg1;
- (void)configurePhotoCollectionToolbarButton:(id)arg1;

@end
