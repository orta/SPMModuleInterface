# SPMModuleInterface

A Swift PM module for extracting a module interface overview shown in Xcode

```sh
~/d/p/o/s/l/SwiftModuleRef  $ swift run module-docs SwiftModuleRef

Generating interface for: SwiftModuleRef
1. Updating the Swift PM Xcode Project
2. Grabbing your Xcode settings
3. Printing module interface:

import Foundation
import Logger
import SourceKittenFramework
import SwiftOnoneSupport

public func generateInterface(module: String, logger: Logger.Logger) throws -> String

```

by using SourceKitten to talk to SourceKit.

I expect there to be 2 outputs: Plaintext like above which works, and HTML which will have divs and ids etc.
