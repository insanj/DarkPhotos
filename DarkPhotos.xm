#import "DarkPhotos.h"

%group Shared

%hook SBApplication

// Replaces the splash screen.
- (id)_defaultPNGPathForScreen:(id)screen launchingOrientation:(int)orientation imageOrientation:(int *)orientation3 resultingScale:(float *)scale {
    if ([[self bundleIdentifier] isEqualToString:@"com.apple.mobileslideshow"]) {
        NSString *path = [NSString stringWithFormat:@"/Library/Application Support/DarkPhotos/%@", [[%orig componentsSeparatedByString:@"/"] lastObject]];
        DPLOG(@"[DarkPhotos] Replacing image %@ with image found found at path %@: %@", %orig, path, [UIImage imageWithContentsOfFile:path]);
        return path;
    }

    return %orig();
}

%end

%end // %end Shared

%group Pangu

%hook PUPhotosSectionHeaderView

- (void)_updateTitleLabel {
    %orig();
    MSHookIvar<UILabel *>(self, "_titleLabel").textColor = [UIColor whiteColor];
}

- (void)_updateDateLabel {
    %orig();
    MSHookIvar<UILabel *>(self, "_dateLabel").textColor = [UIColor whiteColor];
}

- (void)_updateLocationsLabelVisibility {
    %orig();
    MSHookIvar<UILabel *>(self, "_locationsLabel").textColor = [UIColor whiteColor];
}

%end

%hook PUAlbumListCellContentView

// Editing view animation solving
- (void)_updateSubtitleLabelAnimated:(BOOL)arg1 {
    %orig();
    self._subtitleLabel.backgroundColor = [UIColor clearColor];
    self._subtitleLabel.alpha = 1.0;
    self._subtitleLabel.textColor = [UIColor whiteColor];
}

- (void)_updateTitleFieldAnimated:(BOOL)arg1 {
    %orig();

    if (IS_PANGU) {
        self._titleLabel.backgroundColor = [UIColor clearColor];
        self._titleLabel.alpha = 1.0;
        self._titleLabel.textColor = [UIColor whiteColor];
    }

    self._titleTextField.backgroundColor = [UIColor clearColor];
    self._titleTextField.alpha = 1.0;
    self._titleTextField.textColor = [UIColor whiteColor];
}

- (void)layoutSubviews {
    %orig();

    self._titleLabel.textColor = [UIColor whiteColor];    
    self._subtitleLabel.textColor = [UIColor whiteColor];
}

%end

%end // %group Pangu

%group Photos

// "Moments" view background.
%hook PUGridRenderedStrip

- (int)backgroundColorValue {
    return 0;
}

%end

// Replaces and prevents updating of collection/tableview header background colors.
%hook PUPhotosSectionHeaderView

- (id)initWithFrame:(CGRect)frame {
    PUPhotosSectionHeaderView *headerView = (PUPhotosSectionHeaderView *) %orig(frame);
    headerView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.85];
    return headerView;
}

- (void)_updateBackground {
    return;
}

- (void)layoutSubviews {
    %orig();

    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:UILabel.class]) {
            ((UILabel *)v).textColor = [UIColor whiteColor];
        }
    }
}

%end

// Should be self explanatory (thanks, Apple!)...
%hook PUFlatWhiteInterfaceTheme

- (UIColor *)albumListBackgroundColor {
    return [UIColor blackColor];
}

- (NSDictionary *)cloudFeedDefaultTextAttributes {
    return [self cloudFeedWhiteDefaultTextAttributes];
}

- (NSDictionary *)cloudFeedEmphasizedTextAttributes {
    return [self cloudFeedWhiteEmphasizedTextAttributes];
}

- (UIColor *)cloudFeedBackgroundColor {
    return [UIColor blackColor];
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

- (UIBarStyle)photoCollectionToolbarStyle {
    return UIBarStyleBlack;
}

- (UIBarStyle)topLevelNavigationBarStyle {
    return UIBarStyleBlack;
}

- (UIColor *)photoCollectionHeaderBackgroundColorForBackgroundStyle:(unsigned int)arg1 {
    return [UIColor blackColor];
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

// Blah blah blah...
%hook PUAlbumListTableViewCell

- (void)layoutSubviews {
    %orig();
    self.backgroundColor = [UIColor blackColor];
}

%end

%hook PUAlbumListCellContentView

- (void)layoutSubviews {
    %orig();

    self._titleTextField.textColor = [UIColor whiteColor];
    self._subtitleLabel.textColor = [UIColor whiteColor];
}

%end

// Table view controller that shows up under People tab in Steams
%hook PLAlbumStreamingOptionsViewController

- (void)viewWillAppear:(BOOL)animated {
    UITableView *options = MSHookIvar<UITableView *>(self, "_optionsTableView");
    options.backgroundColor = [UIColor blackColor];

    %orig(animated);
}

%end

%end // %group Photos

%ctor {
    %init(Shared);

    // For global appearance changes. This method only works for standard
    // UI elements, and in this case, the UITabBar and UITableViewCells.
    if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.mobileslideshow"]) {
        %init(Photos);
        [UITabBar appearance].barStyle = UIBarStyleBlack;
        [UITableViewCell appearance].backgroundColor = [UIColor darkGrayColor];

        if (IS_PANGU) {
            %init(Pangu);
            [UINavigationBar appearance].barStyle = UIBarStyleBlack;
        }

        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification){
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
    }
}
