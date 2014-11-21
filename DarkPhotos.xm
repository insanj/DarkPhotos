#import "DarkPhotos.h"

/*                                                                                                                                                       
                                                                                                                                                                                                                    
                     iiii                     hhhhhhh                     tttt          
                    i::::i                    h:::::h                  ttt:::t          
                     iiii                     h:::::h                  t:::::t          
                                              h:::::h                  t:::::t          
    eeeeeeeeeeee   iiiiiii    ggggggggg   gggggh::::h hhhhh      ttttttt:::::ttttttt    
  ee::::::::::::ee i:::::i   g:::::::::ggg::::gh::::hh:::::hhh   t:::::::::::::::::t    
 e::::::eeeee:::::eei::::i  g:::::::::::::::::gh::::::::::::::hh t:::::::::::::::::t    
e::::::e     e:::::ei::::i g::::::ggggg::::::ggh:::::::hhh::::::htttttt:::::::tttttt    
e:::::::eeeee::::::ei::::i g:::::g     g:::::g h::::::h   h::::::h     t:::::t          
e:::::::::::::::::e i::::i g:::::g     g:::::g h:::::h     h:::::h     t:::::t          
e::::::eeeeeeeeeee  i::::i g:::::g     g:::::g h:::::h     h:::::h     t:::::t          
e:::::::e           i::::i g::::::g    g:::::g h:::::h     h:::::h     t:::::t    tttttt
e::::::::e         i::::::ig:::::::ggggg:::::g h:::::h     h:::::h     t::::::tttt:::::t
 e::::::::eeeeeeee i::::::i g::::::::::::::::g h:::::h     h:::::h     tt::::::::::::::t
  ee:::::::::::::e i::::::i  gg::::::::::::::g h:::::h     h:::::h       tt:::::::::::tt
    eeeeeeeeeeeeee iiiiiiii    gggggggg::::::g hhhhhhh     hhhhhhh         ttttttttttt  
                                       g:::::g                                          
                           gggggg      g:::::g                                          
                           g:::::gg   gg:::::g                                          
                            g::::::ggg:::::::g                                          
                             gg:::::::::::::g                                           
                               ggg::::::ggg                                             
                                  gggggg                                                                                                                                               

*/

%group Eight

%hook SBApplication

- (id)_pathForExistingImageInCandidates:(id)candidates forSceneID:(id)sceneID size:(CGSize)size scale:(float)scale launchingOrientation:(int)orientation imageOrientation:(int *)orientation6 resultingScale:(float *)scale7 {
	NSString *originalPath = %orig();
	if (originalPath && [[self bundleIdentifier] isEqualToString:@"com.apple.mobileslideshow"]) {
		NSString *darkPath = [NSString stringWithFormat:@"/Library/Application Support/DarkPhotos/%@", [[originalPath componentsSeparatedByString:@"/"] lastObject]];
		DPLOG(@"[DarkPhotos] Replacing image %@ with image found found at path %@: %@", originalPath, darkPath, [UIImage imageWithContentsOfFile:darkPath]);
		return darkPath;
	}

	return originalPath;
}

%end

%end // %group Eight

/*
                                                                                       
    ssssssssss       eeeeeeeeeeee  vvvvvvv           vvvvvvv eeeeeeeeeeee    nnnn  nnnnnnnn    
  ss::::::::::s    ee::::::::::::ee v:::::v         v:::::vee::::::::::::ee  n:::nn::::::::nn  
ss:::::::::::::s  e::::::eeeee:::::eev:::::v       v:::::ve::::::eeeee:::::een::::::::::::::nn 
s::::::ssss:::::se::::::e     e:::::e v:::::v     v:::::ve::::::e     e:::::enn:::::::::::::::n
 s:::::s  ssssss e:::::::eeeee::::::e  v:::::v   v:::::v e:::::::eeeee::::::e  n:::::nnnn:::::n
   s::::::s      e:::::::::::::::::e    v:::::v v:::::v  e:::::::::::::::::e   n::::n    n::::n
      s::::::s   e::::::eeeeeeeeeee      v:::::v:::::v   e::::::eeeeeeeeeee    n::::n    n::::n
ssssss   s:::::s e:::::::e                v:::::::::v    e:::::::e             n::::n    n::::n
s:::::ssss::::::se::::::::e                v:::::::v     e::::::::e            n::::n    n::::n
s::::::::::::::s  e::::::::eeeeeeee         v:::::v       e::::::::eeeeeeee    n::::n    n::::n
 s:::::::::::ss    ee:::::::::::::e          v:::v         ee:::::::::::::e    n::::n    n::::n
  sssssssssss        eeeeeeeeeeeeee           vvv            eeeeeeeeeeeeee    nnnnnn    nnnnnn
                                                                                               
*/

%group Seven

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

%end // %group Seven

/*
                                                                                                                                                                                                            
                   hhhhhhh                                       tttt                                            
                   h:::::h                                    ttt:::t                                            
                   h:::::h                                    t:::::t                                            
                   h:::::h                                    t:::::t                                            
ppppp   ppppppppp   h::::h hhhhh          ooooooooooo   ttttttt:::::ttttttt       ooooooooooo       ssssssssss   
p::::ppp:::::::::p  h::::hh:::::hhh     oo:::::::::::oo t:::::::::::::::::t     oo:::::::::::oo   ss::::::::::s  
p:::::::::::::::::p h::::::::::::::hh  o:::::::::::::::ot:::::::::::::::::t    o:::::::::::::::oss:::::::::::::s 
pp::::::ppppp::::::ph:::::::hhh::::::h o:::::ooooo:::::otttttt:::::::tttttt    o:::::ooooo:::::os::::::ssss:::::s
 p:::::p     p:::::ph::::::h   h::::::ho::::o     o::::o      t:::::t          o::::o     o::::o s:::::s  ssssss 
 p:::::p     p:::::ph:::::h     h:::::ho::::o     o::::o      t:::::t          o::::o     o::::o   s::::::s      
 p:::::p     p:::::ph:::::h     h:::::ho::::o     o::::o      t:::::t          o::::o     o::::o      s::::::s   
 p:::::p    p::::::ph:::::h     h:::::ho::::o     o::::o      t:::::t    tttttto::::o     o::::ossssss   s:::::s 
 p:::::ppppp:::::::ph:::::h     h:::::ho:::::ooooo:::::o      t::::::tttt:::::to:::::ooooo:::::os:::::ssss::::::s
 p::::::::::::::::p h:::::h     h:::::ho:::::::::::::::o      tt::::::::::::::to:::::::::::::::os::::::::::::::s 
 p::::::::::::::pp  h:::::h     h:::::h oo:::::::::::oo         tt:::::::::::tt oo:::::::::::oo  s:::::::::::ss  
 p::::::pppppppp    hhhhhhh     hhhhhhh   ooooooooooo             ttttttttttt     ooooooooooo     sssssssssss    
 p:::::p                                                                                                         
 p:::::p                                                                                                         
p:::::::p                                                                                                        
p:::::::p                                                                                                        
p:::::::p                                                                                                        
ppppppppp                                                                                                        
                                                                                                                                                                                                                        
*/                                                                                                                                                                                                 

%group Photos

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

// found on 7.0
- (void)_updateTitleLabelAnimated:(BOOL)arg1 {
	%orig(arg1);
	MSHookIvar<UILabel *>(self, "_titleLabel").textColor = [UIColor whiteColor];
}

- (void)_updateDateLabelAnimated:(BOOL)arg1 {
	%orig(arg1);
	MSHookIvar<UILabel *>(self, "_dateLabel").textColor = [UIColor whiteColor];
}

- (void)_updateLocationsLabelVisibilityAnimated:(BOOL)arg1 {
	%orig();
	MSHookIvar<UILabel *>(self, "_locationsLabel").textColor = [UIColor whiteColor];
}

// found on 7.1-8.0
/*
- (void)_updateTitleLabelAnimated:(BOOL)arg1 {
	%orig(arg1);
	MSHookIvar<UILabel *>(self, "_titleLabel").textColor = [UIColor whiteColor];
}

- (void)_updateDateLabelAnimated:(BOOL)arg1 {
	%orig(arg1);
	MSHookIvar<UILabel *>(self, "_dateLabel").textColor = [UIColor whiteColor];
}

- (void)_updateLocationsLabelVisibilityAnimated:(BOOL)arg1 {
	%orig();
	M
*/
%end

// found on 7.1-8.0
%hook PUPhotosSectionHeaderContentView

- (id)locationsLabel {
	UILabel *locationsLabel = %orig();
	locationsLabel.textColor = [UIColor whiteColor];
	return locationsLabel;
}

- (void)layoutSubviews {
	%orig();

	self.titleLabel.textColor = [UIColor whiteColor];
	self.dateLabel.textColor = [UIColor whiteColor];
	self.locationsLabel.textColor = [UIColor whiteColor];
}

%end

%hook PUAlbumListCellContentView

- (void)_updateTitleFieldAnimated:(BOOL)arg1 {
	%orig(arg1);

	if ([self respondsToSelector:@selector(_titleLabel)]) {
		self._titleLabel.backgroundColor = [UIColor clearColor];
		self._titleLabel.alpha = 1.0;
		self._titleLabel.textColor = [UIColor whiteColor];
	}

	self._titleTextField.backgroundColor = [UIColor clearColor];
	self._titleTextField.alpha = 1.0;
	self._titleTextField.textColor = [UIColor whiteColor];
}


- (void)_updateSubtitleLabelAnimated:(BOOL)arg1 {
	%orig(arg1);

	self._subtitleLabel.backgroundColor = [UIColor clearColor];
	self._subtitleLabel.alpha = 1.0;
	self._subtitleLabel.textColor = [UIColor whiteColor];
}

%end

// "Moments" view background.
%hook PUGridRenderedStrip

- (int)backgroundColorValue {
	return 0;
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

// Table view controller that shows up under People tab in Steams
%hook PLAlbumStreamingOptionsViewController

- (void)viewWillAppear:(BOOL)animated {
	UITableView *options = MSHookIvar<UITableView *>(self, "_optionsTableView");
	options.backgroundColor = [UIColor blackColor];

	%orig(animated);
}

%end

%end // %group Photos
																																														 
/*
                                                                                                                              
                             tttt                                               
                          ttt:::t                                               
                          t:::::t                                               
                          t:::::t                                               
    ccccccccccccccccttttttt:::::ttttttt       ooooooooooo   rrrrr   rrrrrrrrr   
  cc:::::::::::::::ct:::::::::::::::::t     oo:::::::::::oo r::::rrr:::::::::r  
 c:::::::::::::::::ct:::::::::::::::::t    o:::::::::::::::or:::::::::::::::::r 
c:::::::cccccc:::::ctttttt:::::::tttttt    o:::::ooooo:::::orr::::::rrrrr::::::r
c::::::c     ccccccc      t:::::t          o::::o     o::::o r:::::r     r:::::r
c:::::c                   t:::::t          o::::o     o::::o r:::::r     rrrrrrr
c:::::c                   t:::::t          o::::o     o::::o r:::::r            
c::::::c     ccccccc      t:::::t    tttttto::::o     o::::o r:::::r            
c:::::::cccccc:::::c      t::::::tttt:::::to:::::ooooo:::::o r:::::r            
 c:::::::::::::::::c      tt::::::::::::::to:::::::::::::::o r:::::r            
  cc:::::::::::::::c        tt:::::::::::tt oo:::::::::::oo  r:::::r            
    cccccccccccccccc          ttttttttttt     ooooooooooo    rrrrrrr            
                                                                                                                                                                   
*/

%ctor {
	if (IOS_8) {
		%init(Eight);
	}

	else {
		%init(Seven);
	}

	// For global appearance changes. This method only works for standard
	// UI elements, and in this case, the UITabBar and UITableViewCells.
	if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.mobileslideshow"]) {
		%init(Photos);

		[UITabBar appearance].barStyle = UIBarStyleBlack;
		[UITableViewCell appearance].backgroundColor = [UIColor darkGrayColor];
		[UINavigationBar appearance].barStyle = UIBarStyleBlack;

		[[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification){
			[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
		}];
	}
}
