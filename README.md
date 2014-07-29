NSAttributedString-BBCode
=========================

Subset of BBCode to generate NSAttributedStrings.

>Usage Example:

```
#import "NSAttributedString+bbCode.h"
...
@interface MyViewController ()

@property (nonatomic, assign) IBOutlet UILabel * myLabel;

@end

...

- (void)setLabelText {

    self.myLabel.attributedText = [NSAttributedString attributedStringWithBBCode:@"[color hex=\"00FF00\"]Hello [u]World![/u][/color]"];
}
...

```

>String Syntax Example:

```
[font name="Verdana" size="12"][color hex="00FF00"]Hello[/color] [color hex="0000FF"][u][font size="18"]World[/font][/u][/color][/font]!

```

>Supported Tags:

 - Underline: ``` [u][/u] ```
 - Font: ``` [font name="..." size="..."][/font] ```
 - Color: ``` [color hex="..."][/color] ```

>Advanced Usage Example:

You can add your own tags, such as a ```[code][/code]``` tag...

```
/* MyViewController.h */
...
#import "NSAttributedStringBBCodeDelegate.h"
...

@interface MyViewController : UIViewController<NSAttributedStringBBCodeDelegate>
...
@end
```

```
/* MyViewController.m */
#import "NSAttributedString+bbCode.h"
...
@interface MyViewController ()

@property (nonatomic, assign) IBOutlet UILabel * myLabel;

@end

...

- (void)setLabelText {

    self.myLabel.attributedText = [NSAttributedString attributedStringWithBBCode:@"this is a code example:[code]print Hello, World[/code]" delegate:self];
}

- (NSDictionary *)attributesForTag:(NSString *)tag params:(NSDictionary *)params previous:(NSDictionary *)attributes {
    
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:attributes];
    
    /* [code][/code] */
    if([tag isEqualToString:@"code"]) {
        
        [result setObject:[UIFont fontWithName:@"Courier New" size:11.f] forKey:NSFontAttributeName];
    }
    
    return result;
}
...
```

>Compatibility

iOS 6.0+
