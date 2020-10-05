(ns visualization.core
  (:require [quil.core :as q]
            [clojure.core.matrix :as mat]
            [clojure.core.matrix.stats :as stats]
            [quil.middleware :as m]))

(defn read-meanP [fname]
  (with-open [rdr (clojure.java.io/reader fname)]
    (doall
     (map (fn [x] (map read-string (clojure.string/split x #"\s+"))) (line-seq rdr)))))

(def chr8 (read-meanP "../kakapo8.6.meanP"))
(def chr8-7 (read-meanP "../kakapo8.7.meanP"))
(def chr8-10 (read-meanP "../kakapo8.10.meanP"))
(def chr9 (read-meanP "../kakapo9.6.meanP"))
(def chr2 (read-meanP "../kakapo2.6.meanP"))
(def chr9-12 (read-meanP "../kakapo9.12.meanP"))

(first chr8)
(reduce + (nth chr8 12))

(def snp-height 300)

(defn get-proportions [xs]
  (let [sum (reduce + xs)]
    (map (fn [x] (/ x sum)) xs)))

(defn height [xs]
  (map (fn [x] (int (* x snp-height))) xs))

(height (get-proportions (nth chr8 1000)))

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