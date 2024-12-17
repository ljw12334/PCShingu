package com.pcmall.javaClass;

import java.sql.*;
import java.io.*;

public class Product {
	public String getProps(String className, String pdtName) {
		String prop = "";
		
		String[][] props = {};
		String selectQuery = "select * from list_" + className + " where name='" + pdtName + "'";
		
		if ("cpu".equals(className)) {
			props = new String[][] {{"(", "socket", ")"}, {"", "gen", ""}, {"", "core", "코어"}, {"", "thread", "쓰레드"}, 
				{"기본 클럭: ", "clock_def", "GHz"}, {"최대 클럭: ", "clock_max", "GHz"}, {"내장그래픽: ", "built_in_graphics", ""}};
			
		} else if ("vga".equals(className)) {
			props = new String[][] {{"", "chipset", ""}, {"VRAM: ", "vram", "GB"}, {"팬 개수: ", "fan_count", "개"},
				{"권장 파워 용량: ", "power", "W"}};
				
		} else if ("mainboard".equals(className)) {
			props = new String[][] {{"(", "socket", ")"}, {" ", "chipset", ""}, {"", "standard", ""}, {"메모리: ", "memory_kind", ""},
				{"메모리 슬롯: ", "memory_count", "개"}, {"SATA 슬롯: ", "sata_count", "개"}, {"M.2 슬롯: ", "m2_count", "개"}};
			
		} else if ("ram".equals(className)) {
			props = new String[][] {{"", "kind", ""}, {"", "clock", "Mhz"}, {"히트싱크: ", "heatsink", ""}};
			
		}
		// 실제 정보 취득
		try (
				Connection conn = new Dao().getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(selectQuery);
				) {
			if (rs.next()) {
				for (int i = 0; i < props.length; i++) {
					if (props[i][1].equals("socket")) {
						if (className.equals("cpu")) {
							prop += rs.getString("manufacturer");
						} else {
							prop += rs.getString("cpumf");
						}
					} else if (props[i][1].equals("chipset") && className.equals("mainboard")) {
						prop += rs.getString("cpumf");
					}
					
					
					prop += props[i][0] + rs.getString(props[i][1]) + props[i][2];
					
					
					if (i < props.length - 1) {
						prop += " / ";
					} else if (className.equals("vga")) {
						prop += " / 출력단자: ";
						
						if (rs.getInt("hdmi") > 0) {
							prop += "HDMI";
						}
						
						if (rs.getInt("dp") > 0) {
							if (rs.getInt("hdmi") > 0) prop += ", ";
							prop += "DP";
						}
						
						if (rs.getInt("rgb") > 0) {
							if (rs.getInt("hdmi") > 0 || rs.getInt("dp") > 0) prop += ", ";
							prop += "RGB";
						}
						
						if (rs.getInt("dvi") > 0) {
							if (rs.getInt("hdmi") > 0 || rs.getInt("dp") > 0 || rs.getInt("rgb") > 0) prop += ", ";
							prop += "DVI";
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return prop;
	}
}
