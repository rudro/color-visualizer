# color-visualizer
Minimal command-line SPM project that uses SwiftUI

This project is inspired by https://www.polpiella.dev/launching-a-swiftui-view-from-the-terminal/.  I like how it slowly builds up the peices needed for a command-line SwiftUI app.

However, I wanted to challenge the "with very little code." comment at the end of the article. This project demonstrates that we can get rid of the window creation code, the app deletegate and even the custom app as shown in the blog post.

We're launching the app using a "modern" SwiftUI entry point
```
@main
struct ColorVisualizer: App {
```
as a result of this, we have to manually call the argument parser in the `init()`

If you think this can be trimmed further, do let me know.
