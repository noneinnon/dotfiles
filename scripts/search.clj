(require '[babashka.process :refer [shell]]
         '[babashka.process :as fs]
         '[clojure.string :refer [join]])

(def args *command-line-args*)

(defn search [argv]
  (shell (join " " ["rg" (first argv) "-i" (second argv)])))

(search args)

(comment
  (second (list 1 2 3))
  (shell "ls '$HOME/'")
  (search (list "telescope.actions" "/")))


