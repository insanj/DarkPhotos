#import "DarkPhotos.h"

/*                                                                                                
                                                                                                  
                                     lllllll                                  hhhhhhh             
                                     l:::::l                                  h:::::h             
                                     l:::::l                                  h:::::h             
                                     l:::::l                                  h:::::h             
    ssssssssss   ppppp   ppppppppp    l::::l   aaaaaaaaaaaaa      ssssssssss   h::::h hhhhh       
  ss::::::::::s  p::::ppp:::::::::p   l::::l   a::::::::::::a   ss::::::::::s  h::::hh:::::hhh    
ss:::::::::::::s p:::::::::::::::::p  l::::l   aaaaaaaaa:::::ass:::::::::::::s h::::::::::::::hh  
s::::::ssss:::::spp::::::ppppp::::::p l::::l            a::::as::::::ssss:::::sh:::::::hhh::::::h 
 s:::::s  ssssss  p:::::p     p:::::p l::::l     aaaaaaa:::::a s:::::s  ssssss h::::::h   h::::::h
   s::::::s       p:::::p     p:::::p l::::l   aa::::::::::::a   s::::::s      h:::::h     h:::::h
      s::::::s    p:::::p     p:::::p l::::l  a::::aaaa::::::a      s::::::s   h:::::h     h:::::h
ssssss   s:::::s  p:::::p    p::::::p l::::l a::::a    a:::::assssss   s:::::s h:::::h     h:::::h
s:::::ssss::::::s p:::::ppppp:::::::pl::::::la::::a    a:::::as:::::ssss::::::sh:::::h     h:::::h
s::::::::::::::s  p::::::::::::::::p l::::::la:::::aaaa::::::as::::::::::::::s h:::::h     h:::::h
 s:::::::::::ss   p::::::::::::::pp  l::::::l a::::::::::aa:::as:::::::::::ss  h:::::h     h:::::h
  sssssssssss     p::::::pppppppp    llllllll  aaaaaaaaaa  aaaa sssssssssss    hhhhhhh     hhhhhhh
                  p:::::p                                                                         
                  p:::::p                                                                         
                 p:::::::p                                                                        
                 p:::::::p                                                                        
                 p:::::::p                                                                        
                 ppppppppp                                                                        
                                                                                                  
*/

%group EightSplash

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

/*- (id)_infoplist_defaultPNGPathForSceneID:(id)sceneID size:(CGSize)size scale:(float)scale launchingOrientation:(int)orientation imageOrientation:(int *)orientation5 resultingScale:(float *)scale6 {
    DPLOG(@"%@", %orig());
    return %orig();
}

- (id)defaultPNGPathForSceneID:(id)sceneID size:(CGSize)size scale:(float)scale launchingOrientation:(int)orientation imageOrientation:(int *)orientation5 resultingScale:(float *)scale6 {
    DPLOG(@"%@", %orig());
   return %orig();
}

- (id)defaultSplashBoardImagePathForSceneID:(id)sceneID size:(CGSize)size scale:(float)scale snapshot:(BOOL *)snapshot launchingOrientation:(int)orientation originalOrientation:(int *)orientation6 currentOrientation:(int *)orientation7 {
    DPLOG(@"%@", %orig());
    return %orig();
}
*/

%end

%end // %group EightSplash

%group Splash

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

%end // %group Splash

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
                                                                                             
/*                                                                                                                                                                                        
ppppp   ppppppppp     aaaaaaaaaaaaa  nnnn  nnnnnnnn       ggggggggg   ggggguuuuuu    uuuuuu  
p::::ppp:::::::::p    a::::::::::::a n:::nn::::::::nn    g:::::::::ggg::::gu::::u    u::::u  
p:::::::::::::::::p   aaaaaaaaa:::::an::::::::::::::nn  g:::::::::::::::::gu::::u    u::::u  
pp::::::ppppp::::::p           a::::ann:::::::::::::::ng::::::ggggg::::::ggu::::u    u::::u  
 p:::::p     p:::::p    aaaaaaa:::::a  n:::::nnnn:::::ng:::::g     g:::::g u::::u    u::::u  
 p:::::p     p:::::p  aa::::::::::::a  n::::n    n::::ng:::::g     g:::::g u::::u    u::::u  
 p:::::p     p:::::p a::::aaaa::::::a  n::::n    n::::ng:::::g     g:::::g u::::u    u::::u  
 p:::::p    p::::::pa::::a    a:::::a  n::::n    n::::ng::::::g    g:::::g u:::::uuuu:::::u  
 p:::::ppppp:::::::pa::::a    a:::::a  n::::n    n::::ng:::::::ggggg:::::g u:::::::::::::::uu
 p::::::::::::::::p a:::::aaaa::::::a  n::::n    n::::n g::::::::::::::::g  u:::::::::::::::u
 p::::::::::::::pp   a::::::::::aa:::a n::::n    n::::n  gg::::::::::::::g   uu::::::::uu:::u
 p::::::pppppppp      aaaaaaaaaa  aaaa nnnnnn    nnnnnn    gggggggg::::::g     uuuuuuuu  uuuu
 p:::::p                                                           g:::::g                   
 p:::::p                                               gggggg      g:::::g                   
p:::::::p                                              g:::::gg   gg:::::g                   
p:::::::p                                               g::::::ggg:::::::g                   
p:::::::p                                                gg:::::::::::::g                    
ppppppppp                                                  ggg::::::ggg                      
                                                              gggggg                         
*/
%group Pangu

%hook PUPhotosSectionHeaderView

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

%end

%end // %group Pangu

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

%hook PUPhotosSectionHeaderView

- (void)_updateTitleLabel {
    %orig();
    MSHookIvar<UILabel *>(self, "_titleLabel").textColor = [UIColor whiteColor];
}

%end

%hook PUAlbumListCellContentView

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

%end // %group Seven

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

%hook PUAlbumListCellContentView

- (void)_updateTitleFieldAnimated:(BOOL)arg1 {
    %orig();

    self._titleTextField.backgroundColor = [UIColor clearColor];
    self._titleTextField.alpha = 1.0;
    self._titleTextField.textColor = [UIColor whiteColor];
}

- (void)layoutSubviews {
    %orig();

    self._subtitleLabel.textColor = [UIColor whiteColor];
}

%end

%end // %group Eight

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
        %init(EightSplash);
    }

    else {
        %init(Splash);
    }

    // For global appearance changes. This method only works for standard
    // UI elements, and in this case, the UITabBar and UITableViewCells.
    if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.mobileslideshow"]) {
        %init(Photos);

        [UITabBar appearance].barStyle = UIBarStyleBlack;
        [UITableViewCell appearance].backgroundColor = [UIColor darkGrayColor];

        if (IS_PANGU) {
            [UINavigationBar appearance].barStyle = UIBarStyleBlack;
            %init(Pangu);

            if (IOS_7) {
                %init(Seven);
            }

            else {
                %init(Eight);
            }
        }

        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification){
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
    }
}
