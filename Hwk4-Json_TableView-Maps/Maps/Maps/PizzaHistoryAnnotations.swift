//
//  PizzaHistoryAnnotations.swift
//  PizzaHistoryMap
//
//  Created by Steven Lipton on 6/23/17.
//  Copyright © 2017 Steven Lipton. All rights reserved.
//

import UIKit
import CoreLocation

class PizzaHistoryAnnotations{
    var annotations:[TenAnnotation] = []
    init(){
        //Stevens campus
        var annotation = TenAnnotation( coordinate: CLLocationCoordinate2DMake(40.7449609, -74.0242124), title: "Stevens Campus", subtitle: "Hoboken Education")
        annotation.interPinPhoto = #imageLiteral(resourceName: "Naples")
        annotation.historyText = "Street Food Nationalized - The legend goes that King Umberto and Queen Margherita of Italy got tired of the royal food, which was always French. Looking for both something new and something Italian, in Naples they ordered a local pizzeria to make them pizza, which was up till then poor people's food.  The Queen loved a pizza of tomatoes, fresh mozzarella and basil so much the restaurant named the pizza after her. That the pizza was the colors of the Italian flag may not be a coinicidence. To this day to sell a true Neapolitan pizza, you must be certified by an association of pizza restaurants in Naples for the process and quality of ingredients."
        self.annotations.append(annotation)
        
        //Juliana Apartment
        annotation = TenAnnotation( coordinate: CLLocationCoordinate2DMake(40.7459124, -74.0402085), title: "Juliana Apartment", subtitle: "Hoboken Apartment")
        annotation.interPinPhoto = #imageLiteral(resourceName: "Chatham")
        annotation.historyText = "The first known Pizza restaurant in the United States was in New York’s Little Italy. Gennaro Lombardi in 1905 opened his restaurant, but used a coal oven instead of a traditional wood burning oven, since coal was cheaper than wood in New York. New York Pizza breaks several traditions from its Italian ancestor. Most importantly it is sold in large slices, which meant whole pizzas were made larger than the traditional 14inch/35cm diameter. To make a larger pizza, a  higher gluten recipe is used for the crust, and the pizza is tossed in the air with a spinning motion to expand."
        annotations.append(annotation)
       //cafe
        annotation = TenAnnotation(coordinate: CLLocationCoordinate2DMake(40.7459761,-74.0401086), title: "Gold Roast Cafe ", subtitle: "Coffee")
        annotation.interPinPhoto = #imageLiteral(resourceName: "pin-5")
        annotation.historyText = "antastic little Aussie cafe tucked away in Hoboken. The food is excellent, coffee delicious, and the prospect of summer dining with live music is something to look forward to. The proprietor, Henry, is a stand-up bloke who will not steer you wrong!"
        annotations.append(annotation)
        
        
        //Vine Apartment
        annotation = TenAnnotation( coordinate: CLLocationCoordinate2DMake(40.7486395, -74.038804), title: "Vine Apartment", subtitle: "Light rail way")
        annotation.interPinPhoto = #imageLiteral(resourceName: "New York")
        annotation.historyText = " In 1943, Ike Sewell changed the crust from the thin flatbread to a deep pan, adding traditional Italian/New York  ingredients. Sewell and his cook and eventual manager Rudy Malnati added a layer of sausage to the pan. Some believe the longer cooking time of 20 minutes to 45 minutes of the deep dish meant more beverage consumption, and a higher profit for the restaurant. Deep dish pizza caught on in Chicago, with many competitors in the area. With the 2 inch of deeper pizza crust, the order of ingredients can change between competitors, with a crust ranging in texture from cracker like to bread like and the cheese on top or on the sauce on top."
        annotations.append(annotation)
        
        //Vine2 Learning Experience
        annotation = TenAnnotation(coordinate: CLLocationCoordinate2DMake(40.749413,-74.0374931), title: "Learning Experience", subtitle: "A place for studying")
        annotation.historyText = "History:Chicago seems to modify the traditional crust more than anywhere that makes pizza. The ultimate example is the Pizza pot pie, baked with the crust on top of the ingredients. The ingredients are placed in a ceramic bowl, the pizza dough placed over the bowl, baked, and then the bowl is inverted into the cooked crust  and removed when served to the guest. This is as far from a Neapolitan pizza in structure as you can get.  Theres one thing here and the street vendors of Naples in the 1800’s have in common: they only accept cash here."
        annotations.append(annotation)
        
        //Kith
        annotation = TenAnnotation( coordinate: CLLocationCoordinate2DMake(40.725942,-73.9965976), title: "Kith", subtitle: "Fashion clothes")
        annotation.interPinPhoto = #imageLiteral(resourceName: "Chicago")
        annotation.historyText = "The so-called Hawaiian pizza is not Hawaiian -- It's Canadian. Greek immigrant  to Canada Sam Panopoulos added canned pineapple and Canadian bacon to a pizza in his small restaurant in Chatham, Canada. This is the one of the earliest pizzas without traditional Italian ingredients. As late as 2017, a few months before Panopoulos' death this was controversial, with purists angry about pineapple on a pizza. The president of Iceland started a near diplomatic incident between Canada and Iceland with his statement he would make pineapple on Pizza illegal if he could, with Canadians up in arms about their treasure."
        annotations.append(annotation)
        
        
        annotation = TenAnnotation(coordinate: CLLocationCoordinate2DMake(40.7259496,-73.9947334), title: "SubCulture", subtitle: "live music venue")
        annotation.interPinPhoto = #imageLiteral(resourceName: "pin-5")
        annotation.historyText = "Great venue! New, spacious and comfortable. Went there to a comedy club and was great. It's got a bar with good selection of drinks and is not very expensive. Friendly staff working there."
        annotations.append(annotation)
        
        
        
        //Columbus Circle
        annotation = TenAnnotation( coordinate: CLLocationCoordinate2DMake(40.7678638,-73.9820188), title: "Columbus Cricle", subtitle: "Near a shopping center")
        annotation.interPinPhoto = #imageLiteral(resourceName: "pin-7")
        annotation.historyText = "Californian Fusion cuisine combines elements from many cuisines, and pizza is no exception. Wolfgang Puck hired San Francisco chef Ed LaDou to run the pizza oven at his trendy but exclusive restaurant here when it opened in 1982, and used completely non-traditional ingredients, such as duck sausage and smoked salmon. These pizzas still had a traditional crust. Whlie Queen Margherita may have made it permissible to eat poor peoples food, LaDou made it into rich people’s food."
        annotations.append(annotation)
        
        //40.7677678,-73.9820357  Museum of arts and design
        annotation = TenAnnotation(coordinate: CLLocationCoordinate2DMake(40.7677678,-73.9820357), title: "Museum", subtitle: "Arts and Design")
        annotation.interPinPhoto = #imageLiteral(resourceName: "pin-6")
        annotation.historyText = "History:Two Los Angles Attorneys, Larry Flax and Rick Rosenfeld were so entranced by Ed LaDou’s pizzas they started a casual dining restaurant with some of LaDou’s creations, including a new one of barbecue sauce and chicken. The restaurant was so successful, it became an chain throughout North America,South America and Asia, popularizing non-Italian and often Asian ingredients in pizza. A national food of Italy becomes a uniquely American food all over the world. Suspiciously, there are no locations in Europe."
        annotations.append(annotation)
        
        //baked in color
        annotation = TenAnnotation(coordinate: CLLocationCoordinate2DMake(40.7673744,-73.981909), title: "Baked in color", subtitle: "Food")
        annotation.interPinPhoto = #imageLiteral(resourceName: "New York")
        annotation.historyText = "I don't know how but these cookies are freaking magical, I've literally bought hundreds of them because all my friends and coworkers keep eating them!"
        annotations.append(annotation)
        
        
        
    }
}
