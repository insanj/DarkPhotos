#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "substrate.h"

#ifdef DEBUG
    #define DPLOG(fmt, ...) NSLog((@"[DarkPhotos] %s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define DPLOG(fmt, ...) 
#endif

#define IS_PANGU ([[[UIDevice currentDevice] systemVersion] compare:@"7.1" options:NSNumericSearch] == NSOrderedDescending)
#define IOS_7 ([UIDevice currentDevice].systemVersion.floatValue >= 7.0 && ([UIDevice currentDevice].systemVersion.floatValue < 8.0))
#define IOS_8 ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)

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
- (id)_defaultPNGPathForScreen:(id)screen launchingOrientation:(int)orientation imageOrientation:(int *)orientation3 resultingScale:(CGFloat *)scale;

// iOS 8
- (id)_pathForExistingImageInCandidates:(id)candidates forSceneID:(id)sceneID size:(CGSize)size scale:(float)scale launchingOrientation:(int)orientation imageOrientation:(int *)orientation6 resultingScale:(float *)scale7;
- (id)defaultPNGPathForSceneID:(id)sceneID size:(CGSize)size scale:(float)scale launchingOrientation:(int)orientation imageOrientation:(int *)orientation5 resultingScale:(float *)scale6;
- (id)defaultSplashBoardImagePathForSceneID:(id)sceneID size:(CGSize)size scale:(CGFloat)scale snapshot:(BOOL *)snapshot launchingOrientation:(int)orientation originalOrientation:(int *)orientation6 currentOrientation:(int *)orientation7;

@end

@interface PhotosApplication : UIApplication

@end

@interface PUBackgroundColorView : UIView

- (void)setBackgroundColor:(id)arg1;

@end

@interface PUGridRenderedStrip : UICollectionReusableView

- (int)backgroundColorValue;

@end

@interface PLAlbumStreamingOptionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@end

@interface PUAlbumListTableViewCell : UITableViewCell

@end

@interface PUAlbumListCellContentView : UIView <UITextFieldDelegate>

@property (setter=_setTitleTextField:,retain) UITextField *_titleTextField;
@property (setter=_setSubtitleLabel:,retain) UILabel *_subtitleLabel;
@property (setter=_setDeleteButton:,retain) UIButton *_deleteButton;

// iOS 7.1+
// @property(setter=_setSubtitleLabel:,retain) UILabel * _subtitleLabel;
@property(setter=_setTitleLabel:,retain) UILabel * _titleLabel;

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
- (CGFloat)videoPaletteBottomMargin;
- (CGFloat)videoPaletteSideMargin;
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
- (CGFloat)bannerHeight;
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
- (CGFloat)cloudFeedSeparatorHeight;
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
- (CGFloat)albumListDisabledAlbumTitleAlpha;
- (CGFloat)albumListDisabledAlbumStackViewAlpha;
- (void)configureAlbumListDeleteButton:(id)arg1;
- (void)configureAlbumListSubtitleLabel:(id)arg1;
- (void)configureAlbumListTitleTextField:(id)arg1;
- (id)emptyPlaceholderViewBackgroundColor;
- (unsigned int)emptyPlaceholderStyle;
- (void)configureTopLevelNavigationBarButton:(id)arg1;
- (void)configureTopLevelNavigationBarDoneButton:(id)arg1;
- (int)topLevelStatusBarStyle;
- (id)photoCollectionViewBackgroundColor;
- (CGFloat)photoCollectionToolbarIconToTextSpacerWidth;
- (CGFloat)photoCollectionToolbarTextTitleSpacerWidth;
- (void)configurePhotoCollectionToolbarDeleteButton:(id)arg1;
- (void)configurePhotoCollectionToolbarButton:(id)arg1;

@end

// iOS 7.1+
@interface PUPhotosSectionHeaderContentView : UIView {
    UILabel *dateLabel;
    UIImageView *locationsIconView;
    UILabel *locationsLabel;
    UILabel *titleLabel;
}

@property (retain) UILabel * dateLabel;
@property (retain) UIImageView * locationsIconView;
@property (retain) UILabel * locationsLabel;
@property (retain) UILabel * titleLabel;

- (void)drawRect:(CGRect)arg1;

@end

@interface PUPhotosSectionHeaderView : UIView /*: UICollectionReusableView {
    struct CGSize { 
        float width; 
        float height; 
    struct UIEdgeInsets { 
        float top; 
        float left; 
        float bottom; 
        float right; 
    struct UIEdgeInsets { 
        float top; 
        float left; 
        float bottom; 
        float right; 
    struct UIEdgeInsets { 
        float top; 
        float left; 
        float bottom; 
        float right; 
    UIButton *_actionButton;
    } _actionButtonInitialContentInsets;
    } _actionButtonInitialSize;
    float _actionButtonLabelInitialMaxY;
    NSString *_actionButtonTitle;
    BOOL _allowsLocationInteraction;
    _UIBackdropView *_backdropView;
    NSString *_backdropViewGroupName;
    unsigned int _backgroundStyle;
    } _contentInsets;
    PUPhotosSectionHeaderContentView *_contentView;
    UILabel *_dateLabel;
    <PUPhotosSectionHeaderViewDelegate> *_delegate;
    BOOL _generateDefaultTitleFromDates;
    } _highlightInsets;
    UIView *_highlightView;
    BOOL _highlightViewVisible;
    BOOL _inLayoutTransition;
    UIImageView *_locationsIconView;
    UILabel *_locationsLabel;
    BOOL _performingBatchDateDependentUpdate;
    NSDate *_sectionEndDate;
    int _sectionIndex;
    NSArray *_sectionLocations;
    NSDate *_sectionStartDate;
    NSString *_sectionTitle;
    BOOL _showsActionButton;
    int _style;
    UILabel *_titleLabel;
    BOOL _useYearOnlyForDefaultTitle;
    BOOL _usingBackgroundBlur;
}

@property(copy) NSString * actionButtonTitle;
@property BOOL allowsLocationInteraction;
@property(copy) NSString * backdropViewGroupName;
@property unsigned int backgroundStyle;
@property UIEdgeInsets contentInsets;
@property <PUPhotosSectionHeaderViewDelegate> * delegate;
@property(readonly) BOOL generateDefaultTitleFromDates;
@property UIEdgeInsets highlightInsets;
@property(readonly) NSDate * sectionEndDate;
@property int sectionIndex;
@property(retain) NSArray * sectionLocations;
@property(readonly) NSDate * sectionStartDate;
@property(retain) NSString * sectionTitle;
@property BOOL showsActionButton;
@property int style;
@property(readonly) NSString * synthesizedSectionTitle;
@property(readonly) BOOL useYearOnlyForDefaultTitle;*/

+ (void)_updateLabelGlobalCachedSizes;
+ (void)initialize;

- (id)_dateRangeCompactFormatter;
- (void)_dateRangeFormatterChanged:(id)arg1;
- (id)_dateRangeLongFormatter;
- (id)_dateRangeYearFormatter;
- (BOOL)_disableRasterizeInAnimations;
- (void)_handleActionButton:(id)arg1;
- (void)_handleSignificantDateChange:(id)arg1;
- (void)_hideHighlightView;
- (void)_layoutSubviewsStyleFullDetail;
- (void)_layoutSubviewsStyleOnelineDetail;
- (void)_layoutSubviewsStyleOnelineMinimal;
- (CGSize)_preferredSizeForLabel:(id)arg1;
- (CGSize)_preferredSizeForText:(id)arg1 withFont:(id)arg2;
- (void)_setHighlightViewVisible:(BOOL)arg1;
- (void)_setUsingBackgroundBlur:(BOOL)arg1;
- (void)_updateActionButton;
- (void)_updateBackdropViewGroupName;
- (void)_updateBackground;
- (void)_updateDateDependentLabels;
- (void)_updateDateLabel;
- (void)_updateHighlightView;
- (void)_updateLocationsIconVisibility;
- (void)_updateLocationsLabelVisibility;
- (void)_updateTitleLabel;
- (BOOL)_usingDateAsTitle;
- (id)actionButtonTitle;
- (BOOL)allowLocationTapForTouch:(id)arg1;
- (BOOL)allowsLocationInteraction;
- (void)applyLayoutAttributes:(id)arg1;
- (id)backdropViewGroupName;
- (unsigned int)backgroundStyle;
- (UIEdgeInsets)contentInsets;
- (void)dealloc;
- (id)delegate;
- (void)didEndDisplaying;
- (void)didTransitionFromLayout:(id)arg1 toLayout:(id)arg2;
- (BOOL)generateDefaultTitleFromDates;
- (UIEdgeInsets)highlightInsets;
- (id)initWithFrame:(CGRect)arg1;
- (void)layoutSubviews;
- (void)performBatchUpdateOfDateDependentPropertiesWithBlock:(id)arg1;
- (void)prepareForReuse;
- (id)sectionEndDate;
- (int)sectionIndex;
- (id)sectionLocations;
- (id)sectionStartDate;
- (id)sectionTitle;
- (void)setActionButtonTitle:(id)arg1;
- (void)setAllowsLocationInteraction:(BOOL)arg1;
- (void)setBackdropViewGroupName:(id)arg1;
- (void)setBackgroundStyle:(unsigned int)arg1;
- (void)setContentInsets:(UIEdgeInsets)arg1;
- (void)setDelegate:(id)arg1;
- (void)setGenerateDefaultTitleFromDates:(BOOL)arg1 yearOnly:(BOOL)arg2;
- (void)setHighlightInsets:(UIEdgeInsets)arg1;
- (void)setSectionIndex:(int)arg1;
- (void)setSectionLocations:(id)arg1;
- (void)setSectionStartDate:(id)arg1 endDate:(id)arg2;
- (void)setSectionTitle:(id)arg1;
- (void)setShowsActionButton:(BOOL)arg1;
- (void)setStyle:(int)arg1;
- (BOOL)showsActionButton;
- (int)style;
- (id)synthesizedSectionTitle;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (BOOL)useYearOnlyForDefaultTitle;
- (void)willTransitionFromLayout:(id)arg1 toLayout:(id)arg2;

@end
