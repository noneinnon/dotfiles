#!/usr/bin/env bb
(require '[babashka.process :refer [shell]]
         '[babashka.fs :as fs]
         )

(def args *command-line-args*)

(defmulti open-app (fn [argv] (count argv)))
; osascript -e "tell application \"iTunes\"" -e "activate" -e "end tell"
(defmethod open-app 1 ([[app]]
                       (prn app)
                       (shell (format
                               "osascript -e 'tell application \"%1$s\"' -e 'activate' -e 'end tell'" app))))
; osascript -e "tell application \"Finder\" to open file \"path:to:application\""
(defmethod open-app 2 [[app path]]
  (prn app path)
  (shell (format
          "open -a '%1$s' %2$s" app path)))

(open-app args)
(comment
  (fs/absolutize)
  (open-app '( "Sublime Text" "/Users/antonio" ))
  (shell (format
          "open -a '%1$s' %2$s" "Sublime Text" "$HOME"))
  (shell (format
     "open -a '%1$s' %2$s" "Finder" (fs/path "~/dotfiles")))
  (open-app '("Sublime Text" "~/dotfiles"))
  (open-app '("Safari"))
  (shell (format "osascript -e 'tell application \"%1$s\"' -e 'activate' -e 'end tell'" "Safari")))
