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
