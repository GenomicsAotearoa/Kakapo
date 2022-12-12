(ns figures.core
  (:require [quil.core :as q]
            [clojure.core.matrix :as mat]
            [clojure.core.matrix.stats :as stats]
            [quil.middleware :as m]))

; Wrong pheno file (probs)
(def weights_pheno
   (with-open [rdr (clojure.java.io/reader "/home/josephguhlin/development/kakapo-phenos/weights.txt")]
     (doall
      (for [line (rest (line-seq rdr))]
        (let [[bird b0 b1 M] (clojure.string/split line #"\t")]
          {:bird bird :b0 (read-string b0) :b1 (read-string b1) :M (read-string M)})))))

; Def wrong file
(def clutch-size
  (with-open [rdr (clojure.java.io/reader "/home/josephguhlin/software/gcta_1.93.2beta/clutch_size_kaml_gebv.csv")]
    (doall
     (for [line (rest (line-seq rdr))]
       (let [[_ v] (clojure.string/split line #",")]
         (read-string v))))))

(def cs-norm
  (map
   (fn [x]
     (/
      (- x (apply min clutch-size))
      (apply max clutch-size)))
   clutch-size))

(first weights_pheno)

(apply max (map :M weights_pheno))
(apply min (map :M weights_pheno))

(def M-norm 
  (map 
   (fn [x]
     (/ 
      (- x (apply min (map :M weights_pheno)))
      (apply max (map :M weights_pheno))))
     (map :M weights_pheno)))

(def b1-norm
  (map
   (fn [x]
     (/
      (- x (apply min (map :b1 weights_pheno)))
      (apply max (map :b1 weights_pheno))))
   (map :b1 weights_pheno)))

(defn get-color [val]
  [34 (* val 139) 34])

(get-color 1.0)

(defn setup []
  (q/frame-rate 1))

(defn draw-state [state]
  (q/clear)
  (q/background 255)
  (q/no-stroke)

  (q/fill 5 255 255)

  (doseq [[data n] (map list M-norm (range))]
    (apply q/fill (get-color data))

    (let [pos (* n 5)]
      (q/rect 50 pos 30 5)))

  (doseq [[data n] (map list b1-norm (range))]
    (apply q/fill (get-color data))

    (let [pos (* n 5)]
      (q/rect 85 pos 30 5)))

  (doseq [[data n] (map list cs-norm (range))]
    (apply q/fill (get-color data))
   
    (let [pos (* n 5)]
      (q/rect 120 pos 30 5)
      )))
  ;(q/ellipse 5 5 10 10)

;  (doseq [[i [chr bin-start variants-kb]] (map-indexed vector snpden)]
;    (q/with-translation
;      [i (- HEIGHT 100)]
;      (q/ellipse 0 (* -1 HEIGHT variants-kb) 2 2))))

(def WIDTH 800)
(def HEIGHT 1800)

(q/defsketch visualization
  :title "BVs"
  :size [WIDTH HEIGHT]
  :setup setup
  :draw draw-state
  :feature [:resizable]
  :middleware [m/fun-mode])

