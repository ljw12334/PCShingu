package com.pcmall.dao;

import com.pcmall.javaClass.*;
import com.pcmall.dto.*;

import java.sql.*;
import java.util.ArrayList;



public class BannerDao extends Dao {
	public BannerDto selectOne(String name) {
		
		BannerDto dto = new BannerDto();
		try (
				Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from main_banner where name='" + name + "'");
			) {
			
			if (rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
				dto.setUrl(rs.getString("url"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public ArrayList<BannerDto> selectList() {
		ArrayList<BannerDto> dtoList = new ArrayList<>();
		try (
				Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from main_banner order by id");
				) {
			while (rs.next()) {
				BannerDto dto = new BannerDto();
				
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
				dto.setUrl(rs.getString("url"));
				
				dtoList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
	}
	
	public void insertOne(BannerDto dto) {
		try (
				Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				) {
			stmt.executeUpdate(String.format(
					"insert into main_banner (name, image, url) values ('%s', '%s', '%s')",
					dto.getName(), dto.getImage(), dto.getUrl()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateOne(BannerDto dto) {
		try (
				Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				) {
			stmt.executeUpdate(String.format(
					"update main_banner set image='%s', url='%s' where name='%s'",
					dto.getImage(), dto.getUrl(), dto.getName()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
