package com.pcmall.javaClass;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ParseString {
	public static ArrayList<String> parse(String input) {
		ArrayList<String> result = new ArrayList<>();
		Pattern pattern = Pattern.compile("([^,]+)");
		Matcher matcher = pattern.matcher(input);
		
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		
		if (result.size() <= 0) {
			result.add(input);
		}
		
		return result;
	}
}
