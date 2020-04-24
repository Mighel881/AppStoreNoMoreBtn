// @interface ExpandedTextView : UIView
//   @property (nonatomic) BOOL hasMoreButton;
//   @property (nonatomic) BOOL isCollapsed;
//   @property (nonatomic) int collapsedNumberOfLines;
//   @property (nonatomic) long long numberOfLines;
//   + (_Bool)isTruncatedFor:(id)arg1 layoutMargins:(struct UIEdgeInsets)arg2 collapsedNumberOfLines:(long long)arg3 fitting:(struct CGSize)arg4;
//   + (struct CGSize)itemSizeForAttributedText:(id)arg1 isCollapsed:(_Bool)arg2 layoutMargins:(struct UIEdgeInsets)arg3 collapsedNumberOfLines:(long long)arg4 fitting:(struct CGSize)arg5;
//   + (struct CGSize)itemSizeForText:(id)arg1 isCollapsed:(_Bool)arg2 layoutMargins:(struct UIEdgeInsets)arg3 collapsedNumberOfLines:(long long)arg4 fitting:(struct CGSize)arg5;
//   + (long long)defaultCollapsedNumberOfLines;
// @end
//
// %hook ExpandedTextView
//
//   // -(void)layoutSubviews
//   // {
//   //   %orig;
//   //   ((ExpandedTextView*)self).isCollapsed = NO;
//   //   ((ExpandedTextView*)self).hasMoreButton = NO;
//   //   ((ExpandedTextView*)self).collapsedNumberOfLines = 0;
//   //   ((ExpandedTextView*)self).numberOfLines = 100;
//   // }
//
//   + (_Bool)isTruncatedFor:(id)arg1 layoutMargins:(struct UIEdgeInsets)arg2 collapsedNumberOfLines:(long long)arg3 fitting:(struct CGSize)arg4
//   {
//     arg3 = 0;
//     %orig;
//     return NO;
//   }
//
//   + (struct CGSize)itemSizeForAttributedText:(id)arg1 isCollapsed:(_Bool)arg2 layoutMargins:(struct UIEdgeInsets)arg3 collapsedNumberOfLines:(long long)arg4 fitting:(struct CGSize)arg5
//   {
//     arg2 = NO;
//     arg4 = 0;
//     return %orig;
//   }
//
//   + (struct CGSize)itemSizeForText:(id)arg1 isCollapsed:(_Bool)arg2 layoutMargins:(struct UIEdgeInsets)arg3 collapsedNumberOfLines:(long long)arg4 fitting:(struct CGSize)arg5
//   {
//     arg2 = NO;
//     arg4 = 0;
//     return %orig;
//   }
//
// %end

%hook FadeView

  -(CGFloat)maximumFadeWidth
  {
    return 0;
  }

  -(id)fadeLayer
  {
    return nil;
  }

  -(void)layoutSubviews
  {
    %orig;
    MSHookIvar<CGFloat>(self, "maximumFadeWidth") = 0;
  }

%end

%ctor {
    //%init(ExpandedTextView = objc_getClass("AppStore.ExpandableTextView"));
    %init(FadeView = objc_getClass("AppStore.FadeInDynamicTypeButton"));
}
