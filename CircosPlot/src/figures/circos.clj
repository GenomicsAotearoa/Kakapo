(ns figures.core
  (:require [quil.core :as q]
            [clojure.core.matrix :as mat]
            [clojure.core.matrix.stats :as stats]
            [quil.middleware :as m]))

(def chr-lengths
  (into 
   {}
    (with-open [rdr (clojure.java.io/reader "data/chr_lengths.txt")]
    (doall
     (for [line (line-seq rdr)]
       (clojure.string/split line #"\t"))))))

(def only-large-chrs
  (->> chr-lengths
       (filter
        (fn [[x y]]
          (.startsWith x "S")))
       (map (fn [[x y]] [(read-string (.substring x 1)) (read-string y)]))
       (sort-by first)))

; Output karyotype file
; chr - hsX x 0 155270560 chrx
; chr - hsY y 0 59373566 chry
; chr - 2 2 0 123023803 c2

(def colors (take (count only-large-chrs) (cycle ["c1" "c2" "c3" "c4" "c5" "c6"])))

(with-open [wrt (clojure.java.io/writer "kakapo.karyotype.txt")]
  (doseq [[[chr len] color] (map vector only-large-chrs colors)]
    (.write
     wrt
     (clojure.string/join
      " "
      ["chr"
       "-"
       (str "S" chr)
       (str chr)
       0
       len
       color]))
    (.write wrt "\n")))

(def bin-size 100000)
(def bin-padding (int (/ bin-size 2)))

(with-open [rdr (clojure.java.io/reader "data/out.snpden")
            wrt (clojure.java.io/writer "snpden.hist")]
  (doseq [line (rest (line-seq rdr))]
    (let [[chr start count vkb] (clojure.string/split line #"\s+")]
      (.write
       wrt
       (clojure.string/join
        " "
        [chr
         start
         (+ (read-string start) bin-size)
         vkb
         "\n"])))))

(def founders 
  (into
   #{}
   (with-open [rdr (clojure.java.io/reader "data/founders.ped")]
     (doall
      (for [line (rest (line-seq rdr))]
        (let [[_ bird & _] (clojure.string/split line #"\s+")]
          bird))))))

(with-open [rdr (clojure.java.io/reader "data/bcftoolsroh_rgonly")
            wrt (clojure.java.io/writer "founders.roh")]
  (doseq [line (line-seq rdr)]
    (let [[_ who chr start end _ _ score] (clojure.string/split line #"\s+")]
      (when (founders who)
        (.write
         wrt
         (clojure.string/join
          " "
          [chr
           start
           end
           "\n"]))))))

  
(with-open [rdr (clojure.java.io/reader "data/bcftoolsroh_rgonly")]
  (doseq [line (line-seq rdr)]
    (let [[_ who chr start end _ _ score] (clojure.string/split line #"\s+")]
      (with-open [wrt (clojure.java.io/writer (str who ".roh")  :append true)]
        (.write
         wrt
         (clojure.string/join
          " "
          [chr
           start
           end
           "\n"]))))))
