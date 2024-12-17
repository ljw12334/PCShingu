package com.pcmall.javaClass;

import java.sql.*;
import java.io.*;

public class Dao {
	
	public Connection getConnection() throws Exception {
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/pcmall", "root", "");
		return conn;
	}
	
	
	public void deleteOne(String table, String name, String imagePath) {
		
		try (
				Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from " + table + " where name='" + name + "'");
				) {
			if (rs.next()) {
				String imageName = rs.getString("image");
				stmt.executeUpdate("delete from " + table + " where name='" + name + "'");
				
				File image = new File(imagePath + imageName);
				if (image != null) {
					image.delete();
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public CpuDto selectOneCpu(String name) {
		
		CpuDto dto = new CpuDto();
		
		try (
				Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(String.format("select * from list_cpu where name='%s'", name));
				) {
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setGen(rs.getString("gen"));
				dto.setModifier(rs.getString("modifier"));
				dto.setSocket(rs.getString("socket"));
				dto.setCore(rs.getInt("core"));
				dto.setThread(rs.getInt("thread"));
				dto.setBuiltInGraphics(rs.getString("built_in_graphics"));
				
				// 공통 속성
				dto.setPriceOrigin(rs.getInt("price_origin"));
				dto.setPriceSell(rs.getInt("price_sell"));
				dto.setDiscountRate(rs.getInt("discount_rate"));
				dto.setImage(rs.getString("image"));
				dto.setStock(rs.getInt("stock"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
