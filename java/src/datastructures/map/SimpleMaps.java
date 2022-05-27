package datastructures.map;

import java.util.HashMap;
import java.util.Map;

//  to run: 
//  javac SimpleMaps.java; java SimpleMaps

public class SimpleMaps {

	public static void printMap(Map<String, String> stringMap) {
		stringMap.forEach((key, value) -> {
			System.out.println("Key: " + key + ", value: " + value);
		});
	}

	public static void main(String[] args) {
		System.out.println(SimpleMaps.class.getSimpleName());

		Map<String, String> someMap = new HashMap();

		someMap.put("name", "Henry");
		someMap.put("age", "24");
		someMap.put("favorite food", "steak");

		System.out.println("we have " + someMap.keySet().size() + " keys");

		printMap(someMap);

	}
}
