{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_tp1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/max/Bureau/Work/ECOLE/ING2-EISTI/Semestre4/Programmation_fonctionnelle/Max/Cours/TPs/.stack-work/install/x86_64-linux-tinfo6/72b783abb1e73ba64037c40b8f985515110a71540fd1e023b825043aa0e315c7/9.6.3/bin"
libdir     = "/home/max/Bureau/Work/ECOLE/ING2-EISTI/Semestre4/Programmation_fonctionnelle/Max/Cours/TPs/.stack-work/install/x86_64-linux-tinfo6/72b783abb1e73ba64037c40b8f985515110a71540fd1e023b825043aa0e315c7/9.6.3/lib/x86_64-linux-ghc-9.6.3/tp1-0.1.0.0-FzFvRyrffrELG08hBVFf1i"
dynlibdir  = "/home/max/Bureau/Work/ECOLE/ING2-EISTI/Semestre4/Programmation_fonctionnelle/Max/Cours/TPs/.stack-work/install/x86_64-linux-tinfo6/72b783abb1e73ba64037c40b8f985515110a71540fd1e023b825043aa0e315c7/9.6.3/lib/x86_64-linux-ghc-9.6.3"
datadir    = "/home/max/Bureau/Work/ECOLE/ING2-EISTI/Semestre4/Programmation_fonctionnelle/Max/Cours/TPs/.stack-work/install/x86_64-linux-tinfo6/72b783abb1e73ba64037c40b8f985515110a71540fd1e023b825043aa0e315c7/9.6.3/share/x86_64-linux-ghc-9.6.3/tp1-0.1.0.0"
libexecdir = "/home/max/Bureau/Work/ECOLE/ING2-EISTI/Semestre4/Programmation_fonctionnelle/Max/Cours/TPs/.stack-work/install/x86_64-linux-tinfo6/72b783abb1e73ba64037c40b8f985515110a71540fd1e023b825043aa0e315c7/9.6.3/libexec/x86_64-linux-ghc-9.6.3/tp1-0.1.0.0"
sysconfdir = "/home/max/Bureau/Work/ECOLE/ING2-EISTI/Semestre4/Programmation_fonctionnelle/Max/Cours/TPs/.stack-work/install/x86_64-linux-tinfo6/72b783abb1e73ba64037c40b8f985515110a71540fd1e023b825043aa0e315c7/9.6.3/etc"

getBinDir     = catchIO (getEnv "tp1_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "tp1_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "tp1_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "tp1_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tp1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tp1_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
