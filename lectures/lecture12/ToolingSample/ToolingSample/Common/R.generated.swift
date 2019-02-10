//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 2 colors.
  struct color {
    /// Color `Black`.
    static let black = Rswift.ColorResource(bundle: R.hostingBundle, name: "Black")
    /// Color `White`.
    static let white = Rswift.ColorResource(bundle: R.hostingBundle, name: "White")
    
    /// `UIColor(named: "Black", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func black(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.black, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "White", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.white, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 5 files.
  struct file {
    /// Resource file `AutoCases.stencil`.
    static let autoCasesStencil = Rswift.FileResource(bundle: R.hostingBundle, name: "AutoCases", pathExtension: "stencil")
    /// Resource file `AutoEquatable.stencil`.
    static let autoEquatableStencil = Rswift.FileResource(bundle: R.hostingBundle, name: "AutoEquatable", pathExtension: "stencil")
    /// Resource file `AutoHashable.stencil`.
    static let autoHashableStencil = Rswift.FileResource(bundle: R.hostingBundle, name: "AutoHashable", pathExtension: "stencil")
    /// Resource file `AutoLenses.stencil`.
    static let autoLensesStencil = Rswift.FileResource(bundle: R.hostingBundle, name: "AutoLenses", pathExtension: "stencil")
    /// Resource file `AutoMockable.stencil`.
    static let autoMockableStencil = Rswift.FileResource(bundle: R.hostingBundle, name: "AutoMockable", pathExtension: "stencil")
    
    /// `bundle.url(forResource: "AutoCases", withExtension: "stencil")`
    static func autoCasesStencil(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.autoCasesStencil
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "AutoEquatable", withExtension: "stencil")`
    static func autoEquatableStencil(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.autoEquatableStencil
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "AutoHashable", withExtension: "stencil")`
    static func autoHashableStencil(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.autoHashableStencil
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "AutoLenses", withExtension: "stencil")`
    static func autoLensesStencil(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.autoLensesStencil
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "AutoMockable", withExtension: "stencil")`
    static func autoMockableStencil(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.autoMockableStencil
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = ViewController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
