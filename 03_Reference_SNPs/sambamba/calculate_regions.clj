(ns calculate-regions.main)

(def input-file (first *command-line-args*))

(defn split [x]
 (clojure.string/split x #"\t"))

(with-open [in (java.util.zip.GZIPInputStream.
                 (clojure.java.io/input-stream
                   input-file))]
  (let [lines (line-seq (clojure.java.io/reader in))]
    (doseq [line lines]
      (println (split line)))))
