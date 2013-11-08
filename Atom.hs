module Atom where

-- | The category of a package, for example @dev-lang@
type Category = String

-- | The name of the package, for example @ghc@
type Package = String

-- | The compare pattern in a version, for example @>=@
data Compare = LT | LE | EQ | GE | GT deriving (Show, Eq, Ord)

-- | The version string, which contains the compare pattern and the version
-- itself, for example @>=7.4.2@
data Version = Version Compare String deriving (Show, Eq, Ord)

-- | The slot of a package, for example @0\/7.6.3@
type Slot = String

-- | The repository of a package, for example @gentoo@
type Repository = String

-- | The typeclass that captures an atom
class Atom a where
  -- | The category is always present in an atom
  category :: a -> Category
  -- | The package name is always present in an atom
  package :: a -> Package
  -- | The version maybe present in an atom
  version :: a -> Maybe Version
  -- | The slot maybe present in an atom
  slot :: a -> Maybe Slot
  -- | The repository maybe present in an atom
  repository :: a -> Maybe Repository
