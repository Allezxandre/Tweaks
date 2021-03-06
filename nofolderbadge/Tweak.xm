
@class NSArray;

@protocol SBUserNotificationCapable <NSObject>
- (void)noteBadgeSetLocally;
- (void)scheduleLocalNotifications:(NSArray *)arg1 replaceExistingNotifications:(_Bool)arg2;
- (void)setBadge:(id)arg1;
@end

@interface SBBadgeCountRecipe : NSObject // <SBTestRecipe>
{
}

+ (id)title;
- (void)_changeBadge:(int)arg1;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

@class CLRegion, NSCalendar, NSData, NSDate, NSString, NSTimeZone;

//__attribute__((visibility("hidden")))
@interface UIConcreteLocalNotification : UILocalNotification
{
    NSDate *fireDate;
    NSTimeZone *timeZone;
    unsigned int repeatInterval;
    NSCalendar *repeatCalendar;
    int totalRepeatCount;
    int remainingRepeatCount;
    CLRegion *region;
    BOOL regionTriggersOnce;
    NSString *alertBody;
    BOOL hasAction;
    NSString *alertAction;
    NSString *alertLaunchImage;
    NSString *soundName;
    int applicationIconBadgeNumber;
    NSData *userInfoData;
    BOOL hideAlertTitle;
    BOOL allowSnooze;
    int soundType;
    BOOL interruptAudioAndLockDevice;
    BOOL resumeApplicationInBackground;
    BOOL fireNotificationsWhenAppRunning;
    BOOL showAlarmStatusBarItem;
    NSString *customLockSliderLabel;
    NSString *firedNotificationName;
    NSString *snoozedNotificationName;
    NSString *category;
    BOOL isTransient;
}

- (void)setRegionTriggersOnce:(BOOL)arg1;
- (BOOL)regionTriggersOnce;
- (void)setRegion:(id)arg1;
- (id)region;
- (void)setIsTransient:(BOOL)arg1;
- (BOOL)isTransient;
- (void)setCategory:(id)arg1;
- (id)category;
- (void)setSnoozedNotificationName:(id)arg1;
- (id)snoozedNotificationName;
- (void)setFiredNotificationName:(id)arg1;
- (id)firedNotificationName;
- (void)setCustomLockSliderLabel:(id)arg1;
- (id)customLockSliderLabel;
- (void)setShowAlarmStatusBarItem:(BOOL)arg1;
- (BOOL)showAlarmStatusBarItem;
- (void)setFireNotificationsWhenAppRunning:(BOOL)arg1;
- (BOOL)fireNotificationsWhenAppRunning;
- (void)setResumeApplicationInBackground:(BOOL)arg1;
- (BOOL)resumeApplicationInBackground;
- (void)setInterruptAudioAndLockDevice:(BOOL)arg1;
- (BOOL)interruptAudioAndLockDevice;
- (int)soundType;
- (void)setAllowSnooze:(BOOL)arg1;
- (BOOL)allowSnooze;
- (void)setHideAlertTitle:(BOOL)arg1;
- (BOOL)hideAlertTitle;
- (void)setRemainingRepeatCount:(int)arg1;
- (int)remainingRepeatCount;
- (int)totalRepeatCount;
- (void)setApplicationIconBadgeNumber:(int)arg1;
- (int)applicationIconBadgeNumber;
- (void)setSoundName:(id)arg1;
- (id)soundName;
- (void)setAlertLaunchImage:(id)arg1;
- (id)alertLaunchImage;
- (void)setAlertAction:(id)arg1;
- (id)alertAction;
- (void)setHasAction:(BOOL)arg1;
- (BOOL)hasAction;
- (void)setAlertBody:(id)arg1;
- (id)alertBody;
- (void)setRepeatCalendar:(id)arg1;
- (id)repeatCalendar;
- (void)setRepeatInterval:(unsigned int)arg1;
- (unsigned int)repeatInterval;
- (void)setTimeZone:(id)arg1;
- (id)timeZone;
- (void)setFireDate:(id)arg1;
- (id)fireDate;
- (BOOL)isTriggeredByDate;
- (void)validate;
- (void)clearNonSystemProperties;
- (BOOL)isValid;
- (id)nextFireDateAfterDate:(id)arg1 localTimeZone:(id)arg2;
- (id)nextFireDateForLastFireDate:(id)arg1;
- (id)description;
- (id)userInfo;
- (void)setUserInfo:(id)arg1;
- (void)_setUserInfoData:(id)arg1;
- (int)compareFireDates:(id)arg1;
- (unsigned int)hash;
- (BOOL)isEqual:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (void)dealloc;
- (id)init;
- (void)setTotalRepeatCount:(int)arg1;
- (void)setSoundType:(int)arg1;

@end



%hook SpringBoard
	- (void)setBadge:(id)arg1 {
		%orig;
		NSLog(@"HOOK setBadge - %@",arg1);
	}
	- (void)noteBadgeSetLocally {
		%orig;
		NSLog(@"HOOK noteBadgeSetLocally");
	}
	- (void)_changeBadge:(int)arg1 {
		%orig;
		NSLog(@"HOOK _changeBadge - %d",arg1);
	}
%end

%hook UIKit
	- (void)setApplicationIconBadgeNumber:(int)arg1{
		%orig;
		NSLog(@"HOOK UIKit - setApplicationIconBadgeNumber:%d",arg1);
	}
	- (int)applicationIconBadgeNumber{
		int retour = %orig;
		NSLog(@"HOOK UIKit - applicationIconBadgeNumber -> %d",retour);
		return retour;
	}
%end