(ns guestbook.routes.home
  (:require
   [guestbook.layout :as layout]
   [guestbook.db.core :as db]
   [clojure.java.io :as io]
   [guestbook.middleware :as middleware]
   [ring.util.response]
   [ring.util.http-response :as response]
   [struct.core :as st]))


(def message-schema [[:name
                      st/required 
                      st/string]
                     
                     [:message st/required st/string 
                      {:message "Message must contain at least 10 characters" 
                       :validate #(> (count %) 9)}]])
  
  
  

(defn home-page [request]
  (layout/render request "home.html" {:docs (-> "docs/docs.md" io/resource slurp)}))

(defn about-page [request]
  (layout/render request "about.html"))

(defn home-routes []
  [""
   {:middleware [middleware/wrap-csrf
                 middleware/wrap-formats]}

   ["/" {:get home-page}]
   ["/about" {:get about-page}]])

