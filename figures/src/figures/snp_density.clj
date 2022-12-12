(ns figures.snp_density
  (:require [quil.core :as q]
            [clojure.core.matrix :as mat]
            [clojure.core.matrix.stats :as stats]
            [quil.middleware :as m]))

(def WIDTH 1500)
(def HEIGHT 500)

(def chr-lengths
  (into
   {}
   (with-open [rdr (clojure.java.io/reader "data/chr_lengths.txt")]
     (doall
      (for [j (line-seq rdr)]
        (when (clojure.string/starts-with? (first j) "S")
          (let [[chr length] (clojure.string/split j #"\s")]
            [chr (read-string length)])))))))

(defn parse-snpden [line]
  (let [[chr bin-start snp-count variants-kb] (clojure.string/split line #"\s+")]
    [chr (read-string bin-start) (read-string variants-kb)]))

(def snpden (with-open [rdr (clojure.java.io/reader "data/out.snpden")]
              (doall (map parse-snpden (drop 1 (line-seq rdr))))))

(def total-len (reduce + (vals chr-lengths)))

(def bp-per-px (/ total-len WIDTH))
(int bp-per-px)

(defn setup []
  ; Set frame rate to 30 frames per second.
  (q/frame-rate 1)
  ; Set color mode to HSB (HSV) instead of default RGB.
  (q/color-mode :rgb)
  ; setup function returns initial state. It contains
  ; circle color and position.
  {:color 0
   :angle 0})

(defn update-state [state]
  {})

(defn draw-state [state]
  (q/clear)
  (q/background 255)
  (q/no-stroke)

  (q/stroke 0 0 255)
  (q/fill 0 0 255)
  ;(q/stroke-weight 10)

  ;(q/ellipse 5 5 10 10)

  (doseq [[i [chr bin-start variants-kb]] (map-indexed vector snpden)]
    (q/with-translation
      [i (- HEIGHT 100)]
      (q/ellipse 0 (* -1 HEIGHT variants-kb) 2 2))))



(q/defsketch visualization
  :title "SNP Density"
  :size [WIDTH HEIGHT]
  ; setup function called only once, during sketch initialization.
  :setup setup
  ; update-state is called on each iteration before draw-state.
  :update update-state
  :draw draw-state
  :feature [:resizable]
  ; :features [:keep-on-top]
  ; This sketch uses functional-mode middleware.
  ; Check quil wiki for more info about middlewares and particularly
  ; fun-mode.
  :middleware [m/fun-mode])






(defn convert-bp-to-px [x]
  (int (* WIDTH (/ x (get lengths CHR)))))

(def bp-per-pixel (int (/ (get lengths CHR) WIDTH)))

(defn is-comment? [line]
  (= (first line) \#))

(defn is-RG? [line]
  (= (take 2 line) '(\R \G)))

(defn is-correct-chr? [[_ entry]]
  (= (:chr entry) (symbol CHR)))

; #RG    [2] Sample       [3] Chromosome   [4] Start        [5] End  [6] Length (bp)  [7] Number of markers    [8] Quality (average fwd-bwd phred score)

(defn parse-line [line]
  (let [[_ sample chr start end _ _ qual] (map read-string (clojure.string/split line #"\s+"))]
    [sample {:chr chr :start start :end end :qual qual}]))

(defn read-rohout [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (map
      parse-line
      (doall (filter is-RG? (remove is-comment? (line-seq rdr))))))))

(defn is-good-qual? [[sample data]]
  (>= (:qual data) 80))

(def all (read-rohout "bcftoolsroh"))
(def xs (filter is-good-qual? (filter is-correct-chr? all)))
(count xs)
(count all)

(defn parse-recomb-line [line]
  (let [[_ _ sample _ chr pos] (map read-string (clojure.string/split line #"\s+"))]
    [sample {:chr chr :pos pos}]))

(defn read-recomb-output [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (map
      parse-recomb-line
      (doall (drop 1 (line-seq rdr)))))))

(def recomb-events (read-recomb-output (str (name CHR) "_recombos_chrpos.txt")))

; CLO
(defn parse-clo-line [line]
  (let [[start end mds0 mds1 mds2 mds3 mds4 mds5] (map read-string (clojure.string/split line #"\s+"))]
    [(int start) (int end) (float mds0) (float mds1) (float mds2) (float mds3) (float mds4) (float mds5)]))

(defn read-clo-file [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (map
      parse-clo-line
      (line-seq rdr)))))

(def clo (read-clo-file "../S9_clo.txt"))

(defn split [line]
  (clojure.string/split (clojure.string/trim line) #"\s+"))

; score   div. del. ins.  sequence             begin     end            (left)   repeat             class/family      begin  end    (left)     ID

(defn read-gridss-file [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (map read-string (line-seq rdr)))))

(def gridss (read-gridss-file "../gridss_s8.txt"))

(defn parse-repeat-line [x]
  (let [[_ _ _ _ seqid start end _ _ _ family] x]
    [seqid (read-string start) (read-string end) family]))

(defn read-repeats-output [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (map
      (comp parse-repeat-line split)
      (drop 3 (line-seq rdr))))))

(defn filter-repeat-chr [[chr _ _ _]]
  (= chr "S9"))

(def to-drop (hash-set "rRNA", "rRNA", "Simple_repeat", "Low_complexity", "scRNA", "Satellite", "snRNA"))

(defn drop-repeat? [[_ _ _ family]]
  (get to-drop family))

(def repeats
  (remove drop-repeat? (filter filter-repeat-chr (read-repeats-output "Kakapo_updated.fasta.out"))))

(def repeat-density
  (frequencies
   (map (fn [x] (Math/floor (/ (second x) (* 10 bp-per-pixel)))) repeats)))

(def repeat-density-map (into {} (sort-by first repeat-density)))
(def repeats-max (apply max (vals repeat-density-map)))

(def repeats-density-map
  (into {} (for [[x y] repeat-density]
             [x (/ y repeats-max)])))

(count repeats)

(take 5 repeats)

(frequencies (map last repeats))

(defn is-gene? [x]
  (= (first x) "gene"))

(defn parse-gff-line [x]
  (let [[_ _ type start end] x]
    [type start end]))

(defn read-gff3 [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (filter is-gene?
             (map
              (comp parse-gff-line split)
              (drop 3 (line-seq rdr)))))))

(def gff3 (read-gff3 (str (name CHR) "_mostly_cleaned.gff3")))

(take 5 gff3)

(def gene-density
  (frequencies
   (map (fn [x] (Math/floor (/ (read-string (second x)) (* 10 bp-per-pixel)))) gff3)))

(def gene-density-map (into {} (sort-by first gene-density)))
(def gene-max (apply max (vals gene-density-map)))

(def gene-density-map
  (into {} (for [[x y] gene-density]
             [x (/ y gene-max)])))

(defn setup []
  ; Set frame rate to 30 frames per second.
  (q/frame-rate 1)
  ; Set color mode to HSB (HSV) instead of default RGB.
  (q/color-mode :hsb)
  ; setup function returns initial state. It contains
  ; circle color and position.
  {:color 0
   :angle 0})

(defn update-state [state]
  ; Update sketch state by changing circle color and position.
  {})

(def gwas-hits [63055688 63098195])
(def gwas-hits []) ; for s8

(defn draw-state [state]
  (q/background 255)
  (q/no-stroke)
  ;(q/fill [0 255 255 20])
  (q/fill [292 255 73])
  (q/rect 50 100 WIDTH 25)

  (q/fill [0 0 255 5])

  (doseq [[_ entry] xs]
    (let [xstart (+ 50 (convert-bp-to-px (:start entry)))
          xend (+ 50 (convert-bp-to-px (:end entry)))]
      (when (>= (- xend xstart) 1)
        (q/rect xstart 100 (- xend xstart) 25))))

  (q/fill [132 100 72 90])
  (doseq [[_ event] recomb-events]
    (let [pos (convert-bp-to-px (:pos event))]
      (q/rect (+ 50 pos) 90 2 45)))

  (q/fill [192 99 100 150])
  (q/rect 50
          200
          WIDTH
          1)

  (q/fill [192 99 100 250])
  (doseq [c clo]
    (let [range (map convert-bp-to-px (take 2 c))]
      (q/rect (+ 50 (first range))
              (- 200 (int (* 50 (nth c 2))))
              (- (second range) (first range))
              3)))

  (q/fill [129 255 74 150])

  (doseq [[i density] repeats-density-map]
    (q/rect (+ 50 (* 10 i))
            (- 85 (* 50 density))
            10
            (* 50 density)))

  (q/fill [99 52 82 150])

  (doseq [[i density] gene-density-map]
    (q/rect (+ 50 (* 10 i))
            (- 85 (* 50 density))
            10
            (* 50 density)))

  (q/fill [0 200 200])

  (doseq [hit gwas-hits]
    (q/ellipse (convert-bp-to-px hit) 30 5 5))

;  (q/fill [32 100 82 100])
;  (doseq [i gridss]
;    (q/rect (+ 50 (convert-bp-to-px i))
;            100
;            1
;            25))

;    (doseq [c clo]
;      (let [range (map convert-bp-to-px (take 2 c))]
;        (q/rect (+ 50 (first range))
;                (- 200 (int (* 100 (nth c 3))))
;                (- (second range) (first range))
;                5)))

  ;(q/save "s9plot.jpeg")
  ;(q/exit)
  )


; [69632496 69892411 0.795 0.788]



(q/defsketch visualization
  :title "You spin my circle right round"
  :size [2500 500]
  ; setup function called only once, during sketch initialization.
  :setup setup
  ; update-state is called on each iteration before draw-state.
  :update update-state
  :draw draw-state
  :feature [:resizable]
  ; :features [:keep-on-top]
  ; This sketch uses functional-mode middleware.
  ; Check quil wiki for more info about middlewares and particularly
  ; fun-mode.
  :middleware [m/fun-mode])


















(defn get-proportions [xs]
  (let [sum (reduce + xs)]
    (map (fn [x] (/ x sum)) xs)))

(defn height [xs]
  (map (fn [x] (int (* x snp-height))) xs))

(height (get-proportions (nth chr8 2000)))

; Only 6 so far! Will (eventually) need more!
(def colors [[0, 45, 106] [227, 27, 35] [0, 92, 171] [220, 238, 243] [255, 195, 37] [230, 241, 238]])
(def colors
  [[166 206 227]
   [31 120 180]
   [178 223 138]
   [51 160 44]
   [251 154 153]
   [227 26 28]
   [253 191 111]
   [255 127 0]
   [202 178 214]
   [106 61 154]
   [255 255 153]
   [177 89 40]])

(def colors
  [[141,211,199]
   [255,255,179]
   [190,186,218]
   [251,128,114]
   [128,177,211]
   [253,180,98]
   [179,222,105]
   [252,205,229]
   [217,217,217]
   [188,128,189]
   [204,235,197]
   [255,237,111]])

(def snp-width 1)

(defn draw-snp [xs colors]
  (let [scaled (height (get-proportions xs))]
    (q/no-stroke)
    (doseq [[height color start-y] (map vector scaled colors (reductions + (cons 0 scaled)))]
      (q/with-fill color
        (q/rect 0 start-y snp-width height)))))

(defn setup []
  ; Set frame rate to 30 frames per second.
  (q/frame-rate 1)
  ; Set color mode to HSB (HSV) instead of default RGB.
  (q/color-mode :hsb)
  ; setup function returns initial state. It contains
  ; circle color and position.
  {:color 0
   :angle 0})

(defn update-state [state]
  ; Update sketch state by changing circle color and position.
  {:color (mod (+ (:color state) 0.7) 255)
   :angle (+ (:angle state) 0.1)})

(def snps-per-bin 50)
(def chr chr8)

(defn draw-state [state]
  ; Clear the sketch by filling it with light-grey color.
  (q/background 240)
  ; Set circle color.
  (q/fill (:color state) 255 255)
  ; Calculate x and y coordinates of the circle.
  (let [angle (:angle state)
        x (* 150 (q/cos angle))
        y (* 150 (q/sin angle))]
    ; Move origin point to the center of the sketch.
    (q/with-translation [(/ (q/width) 2)
                         (/ (q/height) 2)]
      ; Draw the circle.
      (q/ellipse x y 100 100)))

  (let [xs (cons 0 (repeat (count chr8) snp-width))]

    (doseq [[snp x] (map vector (map stats/mean (mat/rows (partition-all snps-per-bin chr))) (reductions + xs))]
      (q/with-translation [x 0]
        (draw-snp snp colors)))))

(q/defsketch visualization
  :title "You spin my circle right round"
  :size [2000 500]
  ; setup function called only once, during sketch initialization.
  :setup setup
  ; update-state is called on each iteration before draw-state.
  :update update-state
  :draw draw-state
  :feature [:resizable]
  ; :features [:keep-on-top]
  ; This sketch uses functional-mode middleware.
  ; Check quil wiki for more info about middlewares and particularly
  ; fun-mode.
  :middleware [m/fun-mode])